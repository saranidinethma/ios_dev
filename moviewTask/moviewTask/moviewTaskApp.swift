//
//  moviewTaskApp.swift
//  moviewTask
//
//  Created by sarani dinethma on 2026-10-07.
//

import SwiftUI

@main
struct movieTaskApp: App {
    @State private var viewModel = MovieViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(viewModel)
        }
    }
}
