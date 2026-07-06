//
//  TaskFlowApp.swift
//  TaskFlow
//
//  Created by Luis Daniel Leon Luna on 02.07.2026.
//

import SwiftUI

@main
struct TaskFlowApp: App {
    @State private var appState = AppState()
    
    var body: some Scene {
        WindowGroup {
            RootView()
                .environment(appState)
        }
    }
}
