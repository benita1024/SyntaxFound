//
//  MainAppView.swift
//  SyntaxFound
//
//  Created by Benita Besa on 4/11/25.
//

import SwiftUI

struct MainAppView: View {
    @EnvironmentObject var authViewModel: AuthViewModel

    var body: some View {
        Group {
            if authViewModel.isLoggedIn {
                HomeView()
            } else {
                if authViewModel.isSigningUp {
                    SignUpView()
                } else {
                    LoginView()
                }
            }
        }
    }
}

