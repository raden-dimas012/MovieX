//
//  GenreMapper.swift
//  MovieX
//
//  Created by Raden Dimas on 10/12/22.
//

import Foundation

final class GenreMapper {
    static func mapGenreReponseToDomain(
        input genreResponse: [GenreResponse]
    ) -> [GenreModel] {
        return genreResponse.map { result in
            return GenreModel(
                id: result.id ?? 0,
                title: result.name ?? "-"
            )
        }
    }
}
