//
//  RemoteDataSource.swift
//  MovieX
//
//  Created by Raden Dimas on 10/12/22.
//

import Foundation
import Alamofire
import Combine

public final class RemoteDataSource: NSObject {
    private override init() {}
    static let sharedIntance: RemoteDataSource = RemoteDataSource()
}

extension RemoteDataSource: RemoteDataSourceProtocol {
    public func getNowPlayingMovies() -> AnyPublisher<[NowPlayingResponse], Error> {
        return Future<[NowPlayingResponse], Error> { completion in
            if let url = URL(string: Endpoints.Gets.nowPlaying.url) {
                let params: [String: Any] = [
                    "api_key": ConstantAPI.apiKeyFromPlist
                ]
                AF.request(url, parameters: params).validate()
                    .responseDecodable(of: NowPlayingsResponse.self) { response in
                        switch response.result {
                        case .success(let data):
                            completion(.success(data.results))
                        case .failure:
                            completion(.failure(URLError.invalidResponse))
                        }
                    }
            }
        }.eraseToAnyPublisher()
    }
    public func getCategories() -> AnyPublisher<[GenreResponse], Error> {
        return Future<[GenreResponse], Error> { completion in
            if let url = URL(string: Endpoints.Gets.genres.url) {
                let params: [String: Any] = [
                    "api_key": ConstantAPI.apiKeyFromPlist
                ]
                AF.request(url, parameters: params).validate()
                    .responseDecodable(of: GenresResponse.self) { response in
                        switch response.result {
                        case .success(let data):
                            completion(.success(data.genres))
                        case .failure:
                            completion(.failure(URLError.invalidResponse))
                        }
                    }
            }
        }.eraseToAnyPublisher()
    }
    public func getMovies(
        page: Int,
        genreId: Int
    ) -> AnyPublisher<[MovieResponse], Error> {
        return Future<[MovieResponse], Error> { completion in
            if let url = URL(string: Endpoints.Gets.movie.url) {
                let params: [String: Any] = [
                    "api_key": ConstantAPI.apiKeyFromPlist,
                    "page": page,
                    "with_genres": genreId
                ]
                AF.request(url, parameters: params).validate()
                    .responseDecodable(of: MoviesResponse.self) { response in
                        switch response.result {
                        case .success(let data):
                            completion(.success(data.results))
                        case .failure:
                            completion(.failure(URLError.invalidResponse))
                        }
                    }
            }
        }.eraseToAnyPublisher()
    }
    public func getSearchedMovie(
        page: Int,
        query: String
    ) -> AnyPublisher<[MovieResponse], Error> {
        return Future<[MovieResponse], Error> { completion in
            if let url = URL(string: Endpoints.Gets.search.url) {
                let params: [String: Any] = [
                    "api_key": ConstantAPI.apiKeyFromPlist,
                    "page": page,
                    "query": query
                ]
                AF.request(url, parameters: params).validate()
                    .responseDecodable(of: MoviesResponse.self) { response in
                        switch response.result {
                        case .success(let data):
                            completion(.success(data.results))
                        case .failure(let error):
                            debugPrint(error)
                            completion(.failure(URLError.invalidResponse))
                        }
                    }
            }
        }.eraseToAnyPublisher()
    }
    public func getDetailMovie(
        movieId: Int
    ) -> AnyPublisher<MovieDetailResponse, Error> {
        return Future<MovieDetailResponse, Error> { completion in
            if let url = URL(string: Endpoints.Gets.movieDetail.url + movieId.toString()) {
                let params: [String: Any] = [
                    "api_key": ConstantAPI.apiKeyFromPlist
                ]
                AF.request(url, parameters: params).validate()
                    .responseDecodable(of: MovieDetailResponse.self) { response in
                        switch response.result {
                        case .success(let data):
                            completion(.success(data))
                        case .failure:
                            completion(.failure(URLError.invalidResponse))
                        }
                    }
            }
        }.eraseToAnyPublisher()
    }
    public func getDetailSimilarMovie(
        movieId: Int
    ) -> AnyPublisher<[SimilarMovieResponse], Error> {
        return Future<[SimilarMovieResponse], Error> { completion in
            if let url = URL(string: Endpoints.Gets.similar.url + movieId.toString() + API.similarEndpoint) {
                let params: [String: Any] = [
                    "api_key": ConstantAPI.apiKeyFromPlist
                ]
                AF.request(url, parameters: params).validate()
                    .responseDecodable(of: SimilarMoviesResponse.self) { response in
                        switch response.result {
                        case .success(let data):
                            completion(.success(data.results))
                        case .failure:
                            completion(.failure(URLError.invalidResponse))
                        }
                    }
            }
        }.eraseToAnyPublisher()
    }
}
