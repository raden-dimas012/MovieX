//
//  Injection.swift
//  MovieX
//
//  Created by Raden Dimas on 10/12/22.
//

import Foundation
import RealmSwift

final class Injection: NSObject {
    private func provideRepository() -> MovieRepositoryProtocol {
        let realm = try? Realm()
        let remote: RemoteDataSource = RemoteDataSource.sharedIntance
        let locale: LocalDataSource = LocalDataSource.sharedInstance(realm)
        return MovieRepository.sharedInstances(remote, locale)
    }
    func provideHome() -> HomeUseCase {
        let repository = provideRepository()
        return HomeInteractor(repository: repository)
    }
    func provideSearch() -> SearchUseCase {
        let repository = provideRepository()
        return SearchInteractor(repository: repository)
    }
    func provideFavorite() -> FavoriteUseCase {
        let repository = provideRepository()
        return FavoriteInteractor(repository: repository)
    }
    func provideDetail(movieId: Int) -> DetailUseCase {
        let repository = provideRepository()
        return DetailInteractor(repository: repository, movieDetailId: movieId)
    }
}
