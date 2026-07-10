//
//  TaskFlowApp.swift
//  TaskFlow
//
//  Created by Luis Daniel Leon Luna on 02.07.2026.
//

import SwiftUI
import FirebaseCore

@main
struct TaskFlowApp: App {
    @State private var appState = AppState()
    @State private var dependencies = DependencyContainer()
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            RootView()
                .environment(appState)
                .environment(dependencies)
        }
    }
}
