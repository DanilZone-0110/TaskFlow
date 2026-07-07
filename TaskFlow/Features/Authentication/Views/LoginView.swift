//
//  LoginView.swift
//  TaskFlow
//
//  Created by Luis Daniel Leon Luna on 06.07.2026.
//

import SwiftUI

struct LoginView: View {
    @State private var viewModel: LoginViewModel
    private var isLoading: Bool {
        viewModel.state == .loading
    }
    
    init(onLoginSuccess: @escaping () -> Void) {
        self._viewModel = State(initialValue: LoginViewModel(onLoginSuccess: onLoginSuccess))
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
    }
}

#Preview {
    LoginView{
        print("Login success")
    }
}
