//
//  LoginViewModel.swift
//  TaskFlow
//
//  Created by Luis Daniel Leon Luna on 06.07.2026.
//

import Foundation

@Observable
final class LoginViewModel {
    var email = ""
    var password = ""
    var state: LoginViewState = .idle
    var isFormValid: Bool {
        !email.isEmpty &&
        !password.isEmpty
    }
    private let onLoginSuccess: () -> Void
    
    init(onLoginSuccess: @escaping () -> Void) {
        self.onLoginSuccess = onLoginSuccess
    }
    
    func login() async {
        guard isFormValid else {
            return
        }
        
        state = .loading
        
        try? await Task.sleep(
            for: .seconds(2)
        )
        
        state = .success
        
        onLoginSuccess()
    }
}
