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
    
    var body: some View {
        Group {
            if appState.isAuthenticated {
                Text("Home")
                    .font(.largeTitle)
            } else {
                Text("Login")
                    .font(.largeTitle)
            }
        }
    }
}

#Preview {
    RootView()
}
