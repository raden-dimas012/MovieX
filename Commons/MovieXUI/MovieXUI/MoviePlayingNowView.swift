//
//  MoviePlayingNowView.swift
//  MovieX
//
//  Created by Raden Dimas on 10/01/23.
//

import SwiftUI
import Kingfisher
import Core
import Common

public struct MoviePlayingNowView: View {
    let movie: NowPlayingModel
    public init(movie: NowPlayingModel) {
        self.movie = movie
    }
    public var body: some View {
        KFImage.url(URL(string: API.baseImageUrl+movie.posterPath))
        .resizable()
        .cacheMemoryOnly()
        .onSuccess { success in
            debugPrint("success: \(success)")
        }
        .onFailure { error in
            debugPrint("error: \(error)")
        }
        .placeholder { progress in
            ProgressView(progress).frame(width: 125)
        }
        .cancelOnDisappear(true)
        .fade(duration: 0.35)
        .frame(width: 200, height: 125)
        .cornerRadius(15)
        .shadow(radius: 5)
    }
}
