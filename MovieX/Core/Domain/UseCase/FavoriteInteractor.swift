//
//  FavoriteInteractor.swift
//  MovieX
//
//  Created by Raden Dimas on 29/12/22.
//

import Foundation
import Combine

class FavoriteInteractor: FavoriteUseCase {
    private let repository: MovieRepositoryProtocol
    required init(repository: MovieRepositoryProtocol) {
        self.repository = repository
    }
    func getFavoriteMovies() -> AnyPublisher<[MovieModel], Error> {
        return repository.getFavoriteMovie()
    }
}
