//
//  LoginViewState.swift
//  TaskFlow
//
//  Created by Luis Daniel Leon Luna on 06.07.2026.
//

import Foundation

enum LoginViewState: Equatable {
    case idle
    case loading
    case success
    case failure(String)
}
