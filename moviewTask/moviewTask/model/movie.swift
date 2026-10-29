//
//  movie.swift
//  moviewTask
//
//  Created by sarani dinethma on 2026-10-07.
//

import Foundation

struct Movie: Identifiable {
    var id = UUID()
    var title: String
    var imageName: String
    var isFavorite: Bool
}
