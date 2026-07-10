//
//  LoginViewModel.swift
//  TaskFlow
//
//  Created by Luis Daniel Leon Luna on 06.07.2026.
//

import Foundation

@MainActor
@Observable
final class LoginViewModel {
    var email = ""
    var password = ""
    var state: LoginViewState = .idle
    var isFormValid: Bool {
        !email.isEmpty &&
        !password.isEmpty
    }
    
    private let authenticationService: AuthenticationService
    private let onLoginSuccess: () -> Void
    
    init(authenticationService: AuthenticationService, onLoginSuccess: @escaping () -> Void) {
        self.authenticationService = authenticationService
        self.onLoginSuccess = onLoginSuccess
    }
    
    func login() async {
        guard isFormValid else {
            return
        }
        
        state = .loading
        
        do {
            try await authenticationService.login(email: email, password: password)
            
            state = .success
            onLoginSuccess()
        } catch let error as AuthenticationError {
            state = .failure(error.message)
        } catch {
            state = .failure(AuthenticationError.unknown.message)
        }
    }
}
