//
//  DetailInteractor.swift
//  MovieX
//
//  Created by Raden Dimas on 11/12/22.
//

import Foundation
import Combine

class DetailInteractor: DetailUseCase {
    private let repository: MovieRepositoryProtocol
    private let movieDetailId: Int
    required init(
        repository: MovieRepositoryProtocol,
        movieDetailId: Int
    ) {
        self.repository = repository
        self.movieDetailId = movieDetailId
    }
    func getMovieDetail() -> AnyPublisher<DetailMovieModel, Error> {
        return repository.getDetailMovie(movieId: movieDetailId)
    }
    func getSimilarMovieDetail() -> AnyPublisher<[SimilarMovieModel], Error> {
        return repository.getDetailSimilar(movieId: movieDetailId)
    }
    func addMovieToFavorite(input movie: DetailMovieModel) -> AnyPublisher<Bool, Error> {
        return repository.addMovieToFavorite(input: movie)
    }
    func removeMovieFromFavorite(withId movieId: Int) -> AnyPublisher<Bool, Error> {
        return repository.removeMovieFromFavorite(withId: movieId)
    }
    func getMovieIsFavorite(withId movieId: Int) -> AnyPublisher<Bool, Error> {
        return repository.getMovieIsFavorite(withId: movieId)
    }
}
