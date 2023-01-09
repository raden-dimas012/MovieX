//
//  DataProtocol.swift
//  MovieX
//
//  Created by Raden Dimas on 16/12/22.
//

import Foundation
import Combine

public protocol MovieRepositoryProtocol: AnyObject {
    func getGenres() -> AnyPublisher<[GenreModel], Error>
    func getNowPlaying() -> AnyPublisher<[NowPlayingModel], Error>
    func getMovies(page: Int, genreId: Int) -> AnyPublisher<[MovieModel], Error>
    func getSearchedMovie(page: Int, query: String) -> AnyPublisher<[MovieModel], Error>
    func getDetailMovie(movieId: Int) -> AnyPublisher<DetailMovieModel, Error>
    func getDetailSimilar(movieId: Int) -> AnyPublisher<[SimilarMovieModel], Error>
    func getFavoriteMovie() -> AnyPublisher<[MovieModel], Error>
    func getMovieIsFavorite(withId movieId: Int) -> AnyPublisher<Bool, Error>
    func addMovieToFavorite(input movie: DetailMovieModel) -> AnyPublisher<Bool, Error>
    func removeMovieFromFavorite(withId movieId: Int) -> AnyPublisher<Bool, Error>
}
