//
//  ContentView.swift
//  TaskFlow
//
//  Created by Luis Daniel Leon Luna on 02.07.2026.
//

import SwiftUI

struct RootView: View {
    @Environment(AppState.self)
    private var appState
    
    @Environment(DependencyContainer.self)
    private var dependencies
    
    var body: some View {
        Group {
            if appState.isAuthenticated {
                Text("Home")
                    .font(.largeTitle)
            } else {
                LoginView(authenticationService: dependencies.authenticationService) {
                    appState.isAuthenticated = true
                }
            }
        }
    }
}

#Preview {
    RootView()
}
