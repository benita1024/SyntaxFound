//
//  AuthViewModel.swift
//  SyntaxFound
//
//  Created by Benita Besa on 4/10/25.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class AuthViewModel: ObservableObject {
    @Published var isLoggedIn = true // default to log in screen
    @Published var isSigningUp = false
    @Published var user: User?

    private let auth = Auth.auth()
    private let db = Firestore.firestore()

    init() {
        self.isLoggedIn = auth.currentUser != nil
        self.user = auth.currentUser
    }

    func signUp(email: String, password: String, displayName: String, completion: @escaping (Error?) -> Void) {
        auth.createUser(withEmail: email, password: password) { result, error in
            if let result = result {
                self.isLoggedIn = true
                self.user = result.user
                self.createUserDocument(uid: result.user.uid, email: email, displayName: displayName)
            }
            if let error = error as NSError? {
                print("Firebase sign-up error: \(error), code: \(error.code)")
            }
            completion(error)

        }
    }

    func login(email: String, password: String, completion: @escaping (Error?) -> Void) {
        auth.signIn(withEmail: email, password: password) { result, error in
            if let result = result {
                self.isLoggedIn = true
                self.user = result.user
            }
            completion(error)
        }
    }

    func logout() {
        do {
            try auth.signOut()
            self.user = nil
            self.isLoggedIn = false
            self.isSigningUp = false
        } catch {
            print("Failed to log out: \(error.localizedDescription)")
        }
    }


    private func createUserDocument(uid: String, email: String, displayName: String) {
        db.collection("users").document(uid).setData([
            "uid": uid,
            "email": email,
            "displayName": displayName,
            "xp": 0,
            "streak": 0,
            "completedProblems": [],
            "completedBytes": [],
            "lastActive": Timestamp()
        ])
    }
}
