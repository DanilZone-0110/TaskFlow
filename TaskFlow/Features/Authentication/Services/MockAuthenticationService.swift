//
//  MockAuthenticationService.swift
//  TaskFlow
//
//  Created by Luis Daniel Leon Luna on 09.07.2026.
//

import Foundation

final class MockAuthenticationService: AuthenticationService {
    func login(email: String, password: String) async throws {
        try await Task.sleep(
            for: .seconds(2)
        )
    }
}
