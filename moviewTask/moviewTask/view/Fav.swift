//
//  Fav.swift
//  moviewTask
//
//  Created by sarani dinethma on 2026-10-07.
//




import SwiftUI
import Observation

struct Fav: View {
    @Environment(MovieViewModel.self) private var viewModel

    var body: some View {
        NavigationStack {
            Group {
                if viewModel.favoriteMovies().isEmpty {
                    ContentUnavailableView(
                        "No Favorites",
                        systemImage: "heart.slash",
                        description: Text("Toggle movies in the Movies tab to add them here.")
                    )
                } else {
                    List(viewModel.favoriteMovies()) { movie in
                        HStack(spacing: 16) {
                            Image(movie.imageName)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 60, height: 80)
                                .clipShape(RoundedRectangle(cornerRadius: 8))

                            Text(movie.title)
                                .font(.headline)

                            Spacer()

                            Image(systemName: "heart.fill")
                                .foregroundStyle(.red)
                        }
                        .padding(.vertical, 4)
                    }
                }
            }
            .navigationTitle("Favorites")
        }
    }
}

#Preview {
    Fav()
        .environment(MovieViewModel())
}















