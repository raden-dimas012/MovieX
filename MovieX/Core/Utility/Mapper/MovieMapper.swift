//
//  MovieMapper.swift
//  MovieX
//
//  Created by Raden Dimas on 10/12/22.
//

import Foundation
import RealmSwift

final class MovieMapper {
    static func mapMovieResponseToDomain(
        input movieResponse: [MovieResponse]
    ) -> [MovieModel] {
        return movieResponse.map { result in
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
    static func mapMovieEntitiesToDomain(
        input movieEntities: [MovieEntity]
    ) -> [MovieModel] {
        return movieEntities.map { result in
            return MovieModel(
                id: result.id,
                genreIds: result.genreIds.toArray(ofType: Int.self),
                title: result.title,
                posterPath: result.posterPath,
                releaseDate: result.releaseDate,
                voteAverage: result.voteAverage
            )
        }
    }
    static func mapDetailMovieToEntities(
        input detailMovie: DetailMovieModel
    ) -> MovieEntity {
        let movieEntity = MovieEntity()
        movieEntity.id = detailMovie.id
        let tempList: List<Int> = List<Int>()
        var tempArrayId: [Int] = []
        detailMovie.genres.forEach { genreModel in
            tempArrayId.append(genreModel.id)
        }
        tempList.append(objectsIn: tempArrayId)
        movieEntity.genreIds = tempList
        movieEntity.title = detailMovie.title
        movieEntity.posterPath = detailMovie.posterPath
        movieEntity.releaseDate = detailMovie.releaseDate
        movieEntity.voteAverage = Float(detailMovie.voteAverage)
        return movieEntity
    }
}
