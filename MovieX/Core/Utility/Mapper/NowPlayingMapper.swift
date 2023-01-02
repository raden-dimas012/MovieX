//
//  NowPlayingMapper.swift
//  MovieX
//
//  Created by Raden Dimas on 29/12/22.
//

import Foundation
import RealmSwift

final class NowPlayingMapper {
    static func mapNowPlayingResponseToDomain(
        input nowPlayingResponse: [NowPlayingResponse]
    ) -> [NowPlayingModel] {
        return nowPlayingResponse.map { result in
            return NowPlayingModel(
                id: result.id ?? 0,
                posterPath: result.posterPath ?? ""
            )
        }
    }
}
