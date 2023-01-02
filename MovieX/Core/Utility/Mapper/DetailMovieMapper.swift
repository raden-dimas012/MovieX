//
//  DetailMovieMapper.swift
//  MovieX
//
//  Created by Raden Dimas on 10/12/22.
//

import Foundation
import RealmSwift

final class DetailMovieMapper {
    static func mapDetailMovieResponseToDomain(
        input detailMovieReponse: MovieDetailResponse
    ) -> DetailMovieModel {
        return DetailMovieModel(
            id: detailMovieReponse.id ?? 0,
            isFavorite: false,
            backdropPath: detailMovieReponse.backdropPath ?? "",
            genres: GenreMapper.mapGenreReponseToDomain(input: detailMovieReponse.genres),
            homepage: detailMovieReponse.homepage ?? "",
            overview: detailMovieReponse.overview ?? "-",
            posterPath: detailMovieReponse.posterPath ?? "",
            releaseDate: detailMovieReponse.releaseDate ?? "-",
            tagline: detailMovieReponse.tagline ?? "-",
            title: detailMovieReponse.title ?? "-",
            voteAverage: detailMovieReponse.voteAverage ?? 0.0
        )
    }
}
