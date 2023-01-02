//
//  MovieModel.swift
//  MovieX
//
//  Created by Raden Dimas on 10/12/22.
//

import Foundation

struct MovieModel: Identifiable, Equatable {
    let id: Int
    let genreIds: [Int]
    let title: String
    let posterPath: String
    let releaseDate: String
    let voteAverage: Float
}
