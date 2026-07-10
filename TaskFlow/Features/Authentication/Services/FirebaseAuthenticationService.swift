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
        try await Auth.auth()
            .signIn(withEmail: email, password: password)
    }
}
