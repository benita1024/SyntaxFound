//
//  SyntaxFoundApp.swift
//  SyntaxFound
//
//  Created by Benita Besa on 4/12/25.
//


import SwiftUI
import Firebase

@main
struct SyntaxFoundApp: App {
    @StateObject private var authViewModel = AuthViewModel()
    
    init() {
        FirebaseApp.configure()
        print("✅ Firebase configured (SwiftUI Lifecycle)")
    }

    var body: some Scene {
        WindowGroup {
            MainAppView()
                .environmentObject(authViewModel)
        }
    }
}
