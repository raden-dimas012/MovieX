//
//  SearchMapper.swift
//  MovieX
//
//  Created by Raden Dimas on 29/12/22.
//

import Foundation
import RealmSwift

public final class SearchMapper {
    static func mapMovieResponseToDomain(
        input searchResponse: [MovieResponse]
    ) -> [MovieModel] {
        return searchResponse.map { result in
            return MovieModel(
                id: result.id ?? 0,
                genreIds: result.genreIds ?? [],
                title: result.title ?? "",
                posterPath: result.posterPath ?? "",
                releaseDate: result.releaseDate ?? "",
                voteAverage: result.voteAverage ?? 0.0
            )
        }
    }
}
