//
//  APICall.swift
//  MovieX
//
//  Created by Raden Dimas on 10/12/22.
//

import Foundation

struct API {
    static let baseUrl = "https://api.themoviedb.org/"
    static let genresEndpoint = "3/genre/movie/list"
    static let moviesEndpoint = "3/discover/movie"
    static let movieDetailEndpoint = "3/movie/"
    static let movieNowPlayingEndpoint = "3/movie/now_playing"
    static let baseImageUrl = "https://image.tmdb.org/t/p/w500"
    static let similarEndpoint = "/similar"
    static let searchEndpoint = "3/search/movie"
}

protocol Endpoint {
    var url: String {get}
}

enum Endpoints {
    enum Gets: Endpoint {
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
