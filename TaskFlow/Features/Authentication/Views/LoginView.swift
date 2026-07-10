//
//  LoginView.swift
//  TaskFlow
//
//  Created by Luis Daniel Leon Luna on 06.07.2026.
//

import SwiftUI

struct LoginView: View {
    @State private var viewModel: LoginViewModel
    @State private var showError: Bool = false
    
    private var isLoading: Bool {
        viewModel.state == .loading
    }
    
    private var errorMessage: String {
        if case let .failure(message) = viewModel.state {
            return message
        }
        
        return ""
    }
    
    init(authenticationService: AuthenticationService,
         onLoginSuccess: @escaping () -> Void) {
        self._viewModel = State(
            initialValue: LoginViewModel(
                authenticationService: authenticationService,
                onLoginSuccess: onLoginSuccess
            )
        )
    }
    
    var body: some View {
        VStack(spacing: 20) {
            Text("TaskFlow")
                .font(.largeTitle)
                .bold()
            
            TextField("Email", text: $viewModel.email)
                .textFieldStyle(.roundedBorder)
            
            SecureField("Password", text: $viewModel.password)
                .textFieldStyle(.roundedBorder)
            
            Button {
                Task {
                    await viewModel.login()
                }
            }
            label: {
                if isLoading {
                    ProgressView()
                } else {
                    Text("Login")
                }
            }
            .disabled(
                !viewModel.isFormValid ||
                isLoading
            )
        }
        .padding()
        .onChange(of: viewModel.state) {
            _, newValue in
            if case .failure = newValue {
                showError = true
            }
        }
        .alert("Error", isPresented: $showError) {
            Button("OK") {
                
            }
        } message: {
            Text(errorMessage)
        }
    }
}

#Preview {
    LoginView(authenticationService: MockAuthenticationService()) {
        print("Login success")
    }
}
