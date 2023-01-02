//
//  MovieResponse.swift
//  MovieX
//
//  Created by Raden Dimas on 10/12/22.
//

import Foundation

struct MoviesResponse: Decodable {
    let results: [MovieResponse]
}

struct MovieResponse: Decodable {
    private enum CodingKeys: String, CodingKey {
        case id
        case genreIds = "genre_ids"
        case title
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case voteAverage = "vote_average"
    }
    let id: Int?
    let genreIds: [Int]?
    let title: String?
    let posterPath: String?
    let releaseDate: String?
    let voteAverage: Float?
}
