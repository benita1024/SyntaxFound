//
//  LoginView.swift
//  SyntaxFound
//
//  Created by Benita Besa on 4/12/25.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var authViewModel: AuthViewModel

    @State private var email = ""
    @State private var password = ""
    @State private var errorMessage = ""

    var body: some View {
        VStack(spacing: 25) {
            Text("Welcome Back")
                .font(.largeTitle)
                .bold()

            TextField("Email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .autocapitalization(.none)

            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())

            Button(action: {
                authViewModel.login(email: email, password: password) { error in
                    if let error = error {
                        errorMessage = error.localizedDescription
                    }
                }
            }) {
                Text("Log In")
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

            Button("New to SyntaxFound? Sign up") {
                authViewModel.isSigningUp = true
            }

            .font(.footnote)
            .foregroundColor(.gray)
        }
        .padding()
    }
}
