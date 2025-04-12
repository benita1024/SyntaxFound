//
//  SignUpView.swift
//  SyntaxFound
//
//  Created by Benita Besa on 4/10/25.
//

import SwiftUI


struct SignUpView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    
    @State private var displayName = ""
    @State private var email = ""
    @State private var password = ""
    @State private var errorMessage = ""

    var body: some View {
        VStack(spacing: 25) {
            Text("Create Your Account")
                .font(.largeTitle)
                .bold()

            TextField("Display Name", text: $displayName)
                .textFieldStyle(RoundedBorderTextFieldStyle())

            TextField("Email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .autocapitalization(.none)

            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())

            Button(action: {
                authViewModel.signUp(email: email, password: password, displayName: displayName) { error in
                    if let error = error {
                        errorMessage = error.localizedDescription
                    }
                }
            }) {
                Text("Create Account")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue.opacity(0.8))
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }

            if !errorMessage.isEmpty {
                Text(errorMessage)
                    .foregroundColor(.red)
                    .multilineTextAlignment(.center)
            }
            Button("Already have an account? Log in") {
                authViewModel.isSigningUp = false
            }
            .font(.footnote)
            .foregroundColor(.gray)
        }
        .padding()
    }
}
