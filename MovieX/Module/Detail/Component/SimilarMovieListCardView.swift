//
//  TrailerListCardView.swift
//  MovieX
//
//  Created by Raden Dimas on 18/12/22.
//

import SwiftUI
import Kingfisher

struct SimilarMovieListCardView: View {
    let moviePosterPath: String
    var body: some View {
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
