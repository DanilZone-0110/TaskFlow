//
//  FirebaseAuthenticationService.swift
//  TaskFlow
//
//  Created by Luis Daniel Leon Luna on 09.07.2026.
//

import Foundation
import FirebaseAuth

final class FirebaseAuthenticationService: AuthenticationService {
    func login(email: String, password: String) async throws {
        do {
            try await Auth.auth()
                .signIn(withEmail: email, password: password)
        } catch {
            throw mapError(error)
        }
    }
    
    func mapError(_ error: Error) -> AuthenticationError {
        let nsError = error as NSError
        
        guard let code = AuthErrorCode(rawValue: nsError.code)
        else {
            return .unknown
        }
        
        switch code {
        case .wrongPassword,
            .invalidCredential,
            .userNotFound:
            
            return .invalidCredentials
        
        case .networkError:
            
            return .networkError
            
        default:
            
            return .unknown
        }
    }
}
