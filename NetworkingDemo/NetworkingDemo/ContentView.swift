//
//  ContentView.swift
//  NetworkingDemo
//
//  Created by sarani dinethma on 2026-10-28.
//

import SwiftUI

struct ContentView: View {
    @State private var movies: [MovieDTO] = []
    
    var body: some View {
        
        NavigationStack {
            Group{
                if movies.isEmpty{
                    ProgressView()
                }
                else{
                    List{
                        ForEach(movies) {movie in
                            VStack(alignment: .leading){
                                Text(movie.title)
                                    .font(.title)
                                
                                Text(movie.releaseDate)
                                    .font(.caption)
                                
                                Text(movie.description).multilineTextAlignment(.leading)
                                    .foregroundStyle(.secondary)
                            }
                            
                        }
                    }
                    
                }
            }
            .navigationTitle("IMDB Movies")
            .onAppear{
                
                
            }
            .onDisappear{
                
            }
            .task{
                await fetchMovies()
                
            }
        }
    }
    
    func fetchMovies() async {
        guard let  url = URL(string: "https://ghibliapi.vercel.app/films") else {
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        do {
            let  (data, urlReponse) = try await URLSession.shared.data(for: request)
            
            guard  let httpResponse = urlReponse as? HTTPURLResponse else {
                return
            }
            guard (200...299).contains(httpResponse.statusCode) else{
                return
            }
            
            
            
            movies = try JSONDecoder().decode([MovieDTO].self, from: <#T##Data#>)
        } catch {
            print ("something went wrong, please try again")
            
            
        }
    }
}

#Preview {
    ContentView()
}
