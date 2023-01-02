//
//  HomeRepository.swift
//  MovieX
//
//  Created by Raden Dimas on 10/12/22.
//

import Foundation
import Combine

final class MovieRepository: NSObject {
    typealias HomeInstance = (RemoteDataSource, LocalDataSource) -> MovieRepository
    fileprivate let remote: RemoteDataSource
    fileprivate let locale: LocalDataSource
    private init(remote: RemoteDataSource, locale: LocalDataSource) {
        self.remote = remote
        self.locale = locale
    }
    static let sharedInstances: HomeInstance = { remoteRepo, localRepo in
        return MovieRepository(remote: remoteRepo, locale: localRepo)
    }
}

extension MovieRepository: MovieRepositoryProtocol {
    func getNowPlaying() -> AnyPublisher<[NowPlayingModel], Error> {
        return self.remote.getNowPlayingMovies()
            .map { NowPlayingMapper.mapNowPlayingResponseToDomain(input: $0)
            }.eraseToAnyPublisher()
    }
    func getGenres() -> AnyPublisher<[GenreModel], Error> {
        return self.remote.getCategories()
            .map { GenreMapper.mapGenreReponseToDomain(input: $0)
            }.eraseToAnyPublisher()
    }
    func getMovies(
        page: Int,
        genreId: Int
    ) -> AnyPublisher<[MovieModel], Error> {
        return self.remote.getMovies(page: page, genreId: genreId)
            .map { MovieMapper.mapMovieResponseToDomain(input: $0)
            }.eraseToAnyPublisher()
    }
    func getSearchedMovie(
        page: Int,
        query: String
    ) -> AnyPublisher<[MovieModel], Error> {
        return self.remote.getSearchedMovie(page: page, query: query)
            .map { SearchMapper.mapMovieResponseToDomain(input: $0)
            }.eraseToAnyPublisher()
    }
    func getFavoriteMovie() -> AnyPublisher<[MovieModel], Error> {
        return self.locale.getFavoriteMovies()
            .map { MovieMapper.mapMovieEntitiesToDomain(input: $0)
            }.eraseToAnyPublisher()
    }
    func getDetailMovie(
        movieId: Int
    ) -> AnyPublisher<DetailMovieModel, Error> {
        return self.remote.getDetailMovie(movieId: movieId)
            .map { DetailMovieMapper.mapDetailMovieResponseToDomain(input: $0)
            }.eraseToAnyPublisher()
    }
    func getDetailSimilar(
        movieId: Int
    ) -> AnyPublisher<[SimilarMovieModel], Error> {
        return self.remote.getDetailSimilarMovie(movieId: movieId)
            .map { SimilarMovieMapper.mapSimilarMovieResponseToDomain(input: $0)
            }.eraseToAnyPublisher()
    }
    func getMovieIsFavorite(withId movieId: Int) -> AnyPublisher<Bool, Error> {
        return self.locale.getMovieIsFavorite(withId: movieId)
            .eraseToAnyPublisher()
    }
    func addMovieToFavorite(input movie: DetailMovieModel) -> AnyPublisher<Bool, Error> {
        return self.locale.addMovieToFavorite(input: MovieMapper.mapDetailMovieToEntities(input: movie))
            .eraseToAnyPublisher()
    }
    func removeMovieFromFavorite(withId movieId: Int) -> AnyPublisher<Bool, Error> {
        return self.locale.deleteMovieFromFavorite(withId: movieId)
            .eraseToAnyPublisher()
    }
}
