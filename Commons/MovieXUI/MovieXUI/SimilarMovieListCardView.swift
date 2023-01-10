//
//  SimilarMovieListCardView.swift
//  MovieX
//
//  Created by Raden Dimas on 10/01/23.
//

import SwiftUI
import Kingfisher
import Core
import Common

public struct SimilarMovieListCardView: View {
    let moviePosterPath: String
    public init(moviePosterPath: String) {
        self.moviePosterPath = moviePosterPath
    }
    public var body: some View {
        KFImage.url(URL(string: API.baseImageUrl+moviePosterPath))
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
