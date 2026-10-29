//
//  FocusTaskApp.swift
//  FocusTask
//
//  Created by sarani dinethma on 2026-10-07.
//

import SwiftUI

@main
struct FocusTaskApp: App {
    @State private var viewModel = TasksViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
            
            
                .environment(viewModel)
        }
    }
}
