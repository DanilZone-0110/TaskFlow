//
//  ContentView.swift
//  TaskFlow
//
//  Created by Luis Daniel Leon Luna on 02.07.2026.
//

import SwiftUI

struct RootView: View {
    @State private var counter = 0
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Counter: \(counter)")
                .font(.title)
            Button("Increase") {
                counter += 1
            }
        }
        .padding()
    }
}

#Preview {
    RootView()
}
