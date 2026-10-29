//
//  CategoriesView.swift
//  TasksApp
//
//  Created by sarani dinethma on 2026-10-21.
//

import SwiftUI
import SwiftData

struct CategoriesView: View {
    @Environment(TasksViewModel.self)private var  viewModel
    @Query(sort:\Category.name)private var categories: [Category]
    
    @State private var categeoryTitle = ""
    
    
    
    var body: some View {
        
        NavigationStack{
            List{
                Section {
                    HStack{
                        TextField ("New Category", text: $categeoryTitle)
                        
                        Button("Add"){
                            viewModel.addCategory(name: categeoryTitle)
                            categeoryTitle = ""
                        }
                        .disabled(categeoryTitle.isEmpty)
                    }
                }
                Section {
                    ForEach(categories){category in
                        LabeledContent(category.name.capitalized, value: "\(category.tasks.count)tasks")
                    }
                    .onDelete{offsets in
                        for index in offsets{
                            let selectedCategeory = categories[index]
                            viewModel.delete(selectedCategeory)
                        }
                    }
                }
                .navigationTitle("Categeories")
            }
        }
    }
}

#Preview {
    CategoriesView()
}
