//
//  ContentView.swift
//  FocusTask
//
//  Created by sarani dinethma on 2026-10-07.
//

import SwiftUI

struct ContentView: View {
//    @State private var viewModel = TasksViewModel()
    
    var body: some View {
        TabView{
            TasksView()
                    Label("Tasks", systemImage: "checklist")
                   
                    
                }
            
            
            SettingsView()
                .tabItem{
                    Label("Tasks", systemImage: "gear")
                    
                    
                }
            
        }
    }


#Preview {
    ContentView()
        .environment(TasksViewModel())
}
