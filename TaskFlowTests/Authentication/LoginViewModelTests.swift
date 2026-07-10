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
        let viewModel = LoginViewModel(authenticationService: MockAuthenticationService()) {
            
        }
        
        #expect(
            viewModel.state == .idle
        )
    }
    
    @Test
    func emptyCredentialsAreInvalid() {
        let viewModel = LoginViewModel(authenticationService: MockAuthenticationService()) {
            
        }
        
        #expect(
            viewModel.isFormValid == false
        )
    }
    
    @Test
    func validCredentialsIsEnableForm() {
        let viewModel = LoginViewModel(authenticationService: MockAuthenticationService()) {
            
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
        let viewModel = LoginViewModel(authenticationService: MockAuthenticationService()) {
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
