//
//  MovieDetailResponse.swift
//  MovieX
//
//  Created by Raden Dimas on 10/12/22.
//

import Foundation

public struct MovieDetailResponse: Decodable {
    private enum CodingKeys: String, CodingKey {
        case id
        case backdropPath = "backdrop_path"
        case genres
        case homepage
        case overview
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case tagline
        case title
        case voteAverage = "vote_average"
    }
    let id: Int?
    let backdropPath: String?
    let genres: [GenreResponse]
    let homepage: String?
    let overview: String?
    let posterPath: String?
    let releaseDate: String?
    let tagline: String?
    let title: String?
    let voteAverage: Double?
}
