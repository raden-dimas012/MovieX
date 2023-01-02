//
//  DetailMovieModel.swift
//  MovieX
//
//  Created by Raden Dimas on 11/12/22.
//

import Foundation

struct DetailMovieModel {
    let id: Int
    let isFavorite: Bool
    let backdropPath: String
    let genres: [GenreModel]
    let homepage: String
    let overview: String
    let posterPath: String
    let releaseDate: String
    let tagline: String
    let title: String
    let voteAverage: Double
}
