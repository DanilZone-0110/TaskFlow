//
//  AuthenticationError.swift
//  TaskFlow
//
//  Created by Luis Daniel Leon Luna on 10.07.2026.
//

import Foundation

enum AuthenticationError: Error {
    case invalidCredentials
    case networkError
    case unknown
    
    var message: String {
        switch self {
        case .invalidCredentials:
            "Correo o contraseña incorrectos"
        case .networkError:
            "Error de red. Intenta de nuevo"
        case .unknown:
            "Ocurrió un error inesperado"
        }
    }
}
