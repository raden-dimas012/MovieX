//
//  APICall.swift
//  MovieX
//
//  Created by Raden Dimas on 10/12/22.
//

import Foundation

public struct API {
    public static let baseUrl = "https://api.themoviedb.org/"
    public static let genresEndpoint = "3/genre/movie/list"
    public static let moviesEndpoint = "3/discover/movie"
    public static let movieDetailEndpoint = "3/movie/"
    public static let movieNowPlayingEndpoint = "3/movie/now_playing"
    public static let baseImageUrl = "https://image.tmdb.org/t/p/w500"
    public static let similarEndpoint = "/similar"
    public static let searchEndpoint = "3/search/movie"
}

public protocol Endpoint {
    var url: String {get}
}

public enum Endpoints {
    public enum Gets: Endpoint {
        case genres
        case movie
        case nowPlaying
        case movieDetail
        case search
        case similar
        public var url: String {
            switch self {
            case .genres: return API.baseUrl + API.genresEndpoint
            case .movie: return API.baseUrl + API.moviesEndpoint
            case .nowPlaying: return API.baseUrl + API.movieNowPlayingEndpoint
            case .movieDetail: return API.baseUrl + API.movieDetailEndpoint
            case .search: return API.baseUrl + API.searchEndpoint
            case .similar: return API.baseUrl + API.movieDetailEndpoint
            }
        }
    }
}
