//
//  SimilarMovieMapper.swift
//  MovieX
//
//  Created by Raden Dimas on 29/12/22.
//

import Foundation
import RealmSwift
import Core

public final class SimilarMovieMapper {
    static func mapSimilarMovieResponseToDomain(
        input similarMovieResponse: [SimilarMovieResponse]
    ) -> [SimilarMovieModel] {
        return similarMovieResponse.map { result in
            return SimilarMovieModel(
                id: result.id ?? 0,
                posterPath: result.posterPath ?? ""
            )
        }
    }
}
