//
//  Movies.swift
//  moviewTask
//
//  Created by sarani dinethma on 2026-10-07.
//

import SwiftUI
import Observation

struct Movies: View {
    @Environment(MovieViewModel.self) private var viewModel
    
    var body: some View {
        NavigationStack {
            List(viewModel.movies) { movie in
                HStack(spacing: 16) {
                    Image(movie.imageName)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 60, height: 80)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                    
                    Text(movie.title)
                        .font(.headline)
                    
                    Spacer()
                    
                    Toggle("", isOn: Binding(
                        get: { movie.isFavorite },
                        set: { _ in viewModel.toggleFavorite(movie: movie) }
                    ))
                    .labelsHidden()
                }
                .padding(.vertical, 4)
            }
            .navigationTitle("Movies")
        }
    }
}

#Preview {
    Movies()
        .environment(MovieViewModel())
}
