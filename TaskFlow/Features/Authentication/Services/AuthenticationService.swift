//
//  AuthenticationService.swift
//  TaskFlow
//
//  Created by Luis Daniel Leon Luna on 09.07.2026.
//

import Foundation

protocol AuthenticationService {
    func login(email: String, password: String) async throws
}
