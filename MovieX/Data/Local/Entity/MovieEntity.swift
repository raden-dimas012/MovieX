//
//  MovieEntity.swift
//  MovieX
//
//  Created by Raden Dimas on 27/12/22.
//

import Foundation
import RealmSwift

public class MovieEntity: Object {
    @Persisted(primaryKey: true) var id = 0
    @Persisted var genreIds: List<Int> = List<Int>()
    @Persisted var title: String = ""
    @Persisted var posterPath: String = ""
    @Persisted var releaseDate: String = ""
    @Persisted var voteAverage: Float = 0.0
}
