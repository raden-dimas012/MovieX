//
//  RemoteProtocol.swift
//  MovieX
//
//  Created by Raden Dimas on 17/12/22.
//

import Foundation
import Combine

public protocol RemoteDataSourceProtocol: AnyObject {
    func getCategories() -> AnyPublisher<[GenreResponse], Error>
    func getNowPlayingMovies() -> AnyPublisher<[NowPlayingResponse], Error>
    func getMovies(page: Int, genreId: Int) -> AnyPublisher<[MovieResponse], Error>
    func getSearchedMovie(page: Int, query: String) -> AnyPublisher<[MovieResponse], Error>
    func getDetailMovie(movieId: Int) -> AnyPublisher<MovieDetailResponse, Error>
    func getDetailSimilarMovie(movieId: Int) -> AnyPublisher<[SimilarMovieResponse], Error>
}
