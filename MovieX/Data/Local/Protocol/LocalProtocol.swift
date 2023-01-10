//
//  LocalProtocol.swift
//  MovieX
//
//  Created by Raden Dimas on 27/12/22.
//

import Foundation
import RealmSwift
import Combine

public protocol LocalDataSourceProtocol: AnyObject {
    func getFavoriteMovies() -> AnyPublisher<[MovieEntity], Error>
    func getMovieIsFavorite(withId movieId: Int) -> AnyPublisher<Bool, Error>
    func addMovieToFavorite(input movie: MovieEntity) -> AnyPublisher<Bool, Error>
    func deleteMovieFromFavorite(withId movieId: Int) -> AnyPublisher<Bool, Error>
}
