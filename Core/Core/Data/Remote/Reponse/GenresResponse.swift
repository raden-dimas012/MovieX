//
//  CategoryResponse.swift
//  MovieX
//
//  Created by Raden Dimas on 10/12/22.
//

import Foundation

public struct GenresResponse: Decodable {
    let genres: [GenreResponse]
}

public struct GenreResponse: Decodable {
    let id: Int?
    let name: String?
}
