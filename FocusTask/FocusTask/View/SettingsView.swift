//
//  SettingsView.swift
//  FocusTask
//
//  Created by sarani dinethma on 2026-10-07.
//

import SwiftUI

struct SettingsView: View {
    @Environment(TasksViewModel.self) private var viewModel
//        var viewModel: TasksViewModel
        
        var body : some View{
            
            Form {
                Section {
                    LabeledContent("total", value: "\(viewModel.tasks.count)")
                    LabeledContent("total", value: "\(viewModel.completedItemsCount())")
                }
            }
        }
        
    }


#Preview {
    SettingsView()
        .environment(TasksViewModel())
}

