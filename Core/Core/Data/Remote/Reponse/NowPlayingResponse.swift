//
//  NowPlayingResponse.swift
//  MovieX
//
//  Created by Raden Dimas on 29/12/22.
//

import Foundation

public struct NowPlayingsResponse: Decodable {
    let results: [NowPlayingResponse]
}

public struct NowPlayingResponse: Decodable {
    private enum CodingKeys: String, CodingKey {
        case id
        case posterPath = "poster_path"
    }
    let id: Int?
    let posterPath: String?
}
