//
//  LoginViewModelTests.swift
//  TaskFlowTests
//
//  Created by Luis Daniel Leon Luna on 07.07.2026.
//

import Testing

@testable import TaskFlow

@MainActor
struct LoginViewModelTests {
    @Test
    func initialStateIsIdle() {
        let viewModel = LoginViewModel {
            
        }
        
        #expect(
            viewModel.state == .idle
        )
    }
    
    @Test
    func emptyCredentialsAreInvalid() {
        let viewModel = LoginViewModel {
            
        }
        
        #expect(
            viewModel.isFormValid == false
        )
    }
    
    @Test
    func validCredentialsIsEnableForm() {
        let viewModel = LoginViewModel {
            
        }
        
        viewModel.email = "test@example.com"
        viewModel.password = "password"
        
        #expect(
            viewModel.isFormValid
        )
    }
    
    @Test
    func successfulLoginChangesState() async {
        var successCalled = false
        let viewModel = LoginViewModel {
            successCalled = true
        }
        
        viewModel.email = "test@example.com"
        viewModel.password = "password"
        await viewModel.login()
        
        #expect(
            viewModel.state == .success
        )
        
        #expect(
            successCalled
        )
    }
}
