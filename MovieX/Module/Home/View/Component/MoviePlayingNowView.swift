//
//  MoviePlayingNowView.swift
//  MovieX
//
//  Created by Raden Dimas on 10/12/22.
//

import SwiftUI
import Kingfisher

struct MoviePlayingNowView: View {
    let movie: NowPlayingModel
    var body: some View {
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
