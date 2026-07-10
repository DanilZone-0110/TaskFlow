//
//  DependencyContainer.swift
//  TaskFlow
//
//  Created by Luis Daniel Leon Luna on 09.07.2026.
//

import Foundation

@Observable

final class DependencyContainer {
    let authenticationService: AuthenticationService
    
    init() {
        self.authenticationService = FirebaseAuthenticationService()
    }
}
