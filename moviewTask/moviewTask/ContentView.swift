//
//  ContentView.swift
//  moviewTask
//
//  Created by sarani dinethma on 2026-10-07.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Movies()
                .tabItem {
                    Label("Movies", systemImage: "film")
                }
            
            Fav()
                .tabItem {
                    Label("Favorites", systemImage: "heart.fill")
                }
        }
    }
}

#Preview {
    ContentView()
        .environment(MovieViewModel())
}
