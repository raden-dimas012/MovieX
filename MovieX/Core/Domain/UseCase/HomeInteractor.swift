//
//  HomeInteractor.swift
//  MovieX
//
//  Created by Raden Dimas on 10/12/22.
//

import Foundation
import Combine

class HomeInteractor: HomeUseCase {
    private let repository: MovieRepositoryProtocol
    required init(repository: MovieRepositoryProtocol) {
        self.repository = repository
    }
    func getMoviesNowPlaying() -> AnyPublisher<[NowPlayingModel], Error> {
        return repository.getNowPlaying()
    }
    func getGenres() -> AnyPublisher<[GenreModel], Error> {
        return repository.getGenres()
    }
    func getMovies(
        page: Int,
        genreId: Int
    ) -> AnyPublisher<[MovieModel], Error> {
        return repository.getMovies(page: page, genreId: genreId)
    }
}
