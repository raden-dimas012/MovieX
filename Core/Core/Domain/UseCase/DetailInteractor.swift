//
//  DetailInteractor.swift
//  MovieX
//
//  Created by Raden Dimas on 11/12/22.
//

import Foundation
import Combine

public class DetailInteractor: DetailUseCase {
    private let repository: MovieRepositoryProtocol
    private let movieDetailId: Int
    required init(
        repository: MovieRepositoryProtocol,
        movieDetailId: Int
    ) {
        self.repository = repository
        self.movieDetailId = movieDetailId
    }
    public func getMovieDetail() -> AnyPublisher<DetailMovieModel, Error> {
        return repository.getDetailMovie(movieId: movieDetailId)
    }
    public func getSimilarMovieDetail() -> AnyPublisher<[SimilarMovieModel], Error> {
        return repository.getDetailSimilar(movieId: movieDetailId)
    }
    public func addMovieToFavorite(input movie: DetailMovieModel) -> AnyPublisher<Bool, Error> {
        return repository.addMovieToFavorite(input: movie)
    }
    public func removeMovieFromFavorite(withId movieId: Int) -> AnyPublisher<Bool, Error> {
        return repository.removeMovieFromFavorite(withId: movieId)
    }
    public func getMovieIsFavorite(withId movieId: Int) -> AnyPublisher<Bool, Error> {
        return repository.getMovieIsFavorite(withId: movieId)
    }
}
