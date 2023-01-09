//
//  SearchInteractor.swift
//  MovieX
//
//  Created by Raden Dimas on 25/12/22.
//

import Foundation
import Combine

public class SearchInteractor: SearchUseCase {
    private let repository: MovieRepositoryProtocol
    required init(repository: MovieRepositoryProtocol) {
        self.repository = repository
    }
    public func getSearchedMovies(
        page: Int,
        query: String
    ) -> AnyPublisher<[MovieModel], Error> {
        return repository.getSearchedMovie(page: page, query: query)
    }
}
