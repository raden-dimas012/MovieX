//
//  LocalDataSource.swift
//  MovieX
//
//  Created by Raden Dimas on 27/12/22.
//

import Foundation
import RealmSwift
import Combine

public final class LocalDataSource: NSObject {
    private let realm: Realm?
    private init(realm: Realm?) {
        self.realm = realm
    }
    static let sharedInstance: (Realm?) -> LocalDataSource = { realmDatabase in
        return LocalDataSource(realm: realmDatabase)
    }
}

extension LocalDataSource: LocalDataSourceProtocol {
    public func getFavoriteMovies() -> AnyPublisher<[MovieEntity], Error> {
        return Future<[MovieEntity], Error> { completion in
            if let realm = self.realm {
                let moviesEntities: Results<MovieEntity> = {
                    realm.objects(MovieEntity.self)
                }()
                completion(.success(moviesEntities.toArray(ofType: MovieEntity.self)))
            } else {
                completion(.failure(DatabaseError.invalidInstance))
            }
        }.eraseToAnyPublisher()
    }
    public func getMovieIsFavorite(withId movieId: Int) -> AnyPublisher<Bool, Error> {
        return Future<Bool, Error> { completion in
            if let realm = self.realm {
                do {
                    let movieById = realm.objects(MovieEntity.self).filter("id = %@", movieId)
                    try realm.write {
                        if movieById.isEmpty {
                            completion(.success(false))
                        } else {
                            completion(.success(true))
                        }
                    }
                } catch {
                    completion(.failure(DatabaseError.requestFailed))
                }
            } else {
                completion(.failure(DatabaseError.requestFailed))
            }
        }.eraseToAnyPublisher()
    }
    public func addMovieToFavorite(input movie: MovieEntity) -> AnyPublisher<Bool, Error> {
        return Future<Bool, Error> { completion in
            if let realm = self.realm {
                do {
                    try realm.write {
                        realm.add(movie, update: .all)
                        completion(.success(true))
                    }
                } catch {
                    completion(.failure(DatabaseError.requestFailed))
                }
            } else {
                completion(.failure(DatabaseError.invalidInstance))
            }
        }.eraseToAnyPublisher()
    }
    public func deleteMovieFromFavorite(withId movieId: Int) -> AnyPublisher<Bool, Error> {
        return Future<Bool, Error> { completion in
            if let realm = self.realm {
                do {
                    let movies = realm.objects(MovieEntity.self).filter("id = %@", movieId)
                    try realm.write {
                        movies.forEach { movie in
                            realm.delete(movie)
                        }
                        completion(.success(true))
                    }
                } catch {
                    completion(.failure(DatabaseError.requestFailed))
                }
            } else {
                completion(.failure(DatabaseError.invalidInstance))
            }
        }.eraseToAnyPublisher()
    }
}
