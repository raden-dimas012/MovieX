//
//  DetailMovieModel.swift
//  MovieX
//
//  Created by Raden Dimas on 11/12/22.
//

import Foundation

public struct DetailMovieModel {
    public let id: Int
    public let isFavorite: Bool
    public let backdropPath: String
    public let genres: [GenreModel]
    public let homepage: String
    public let overview: String
    public let posterPath: String
    public let releaseDate: String
    public let tagline: String
    public let title: String
    public let voteAverage: Double
}
