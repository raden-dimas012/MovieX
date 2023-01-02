//
//  UseCaseProtocol.swift
//  MovieX
//
//  Created by Raden Dimas on 17/12/22.
//

import Foundation
import Combine

protocol HomeUseCase {
    func getMoviesNowPlaying() -> AnyPublisher<[NowPlayingModel], Error>
    func getGenres() -> AnyPublisher<[GenreModel], Error>
    func getMovies(page: Int, genreId: Int) -> AnyPublisher<[MovieModel], Error>
}
protocol SearchUseCase {
    func getSearchedMovies(page: Int, query: String) -> AnyPublisher<[MovieModel], Error>
}
protocol FavoriteUseCase {
    func getFavoriteMovies() -> AnyPublisher<[MovieModel], Error>
}
protocol DetailUseCase {
    func getMovieDetail() -> AnyPublisher<DetailMovieModel, Error>
    func getSimilarMovieDetail() -> AnyPublisher<[SimilarMovieModel], Error>
    func getMovieIsFavorite(withId movieId: Int) -> AnyPublisher<Bool, Error>
    func addMovieToFavorite(input movie: DetailMovieModel) -> AnyPublisher<Bool, Error>
    func removeMovieFromFavorite(withId movieId: Int) -> AnyPublisher<Bool, Error>
}
