//
//  MovieListCardView.swift
//  MovieX
//
//  Created by Raden Dimas on 10/12/22.
//

import SwiftUI
import Kingfisher

struct MovieListCardView: View { // shared components
    let movie: MovieModel
    var body: some View {
        HStack {
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
                ProgressView(progress).frame(width: 100, height: 100)
            }
            .cancelOnDisappear(true)
            .fade(duration: 0.35)
            .frame(width: 100, height: 150)
            .cornerRadius(25)
            .shadow(radius: 5)
            VStack(alignment: .leading, spacing: 8) {
                Text(String(movie.voteAverage))
                    .font(.system(size: 12))
                    .frame(maxWidth: .infinity, alignment: .trailing)
                Text(movie.title)
                    .font(.system(size: 12))
                    .bold()
                    .padding(.bottom, 8)
                Text(Helper.getGenreMovies(genreID: movie.genreIds).joined(separator: ", "))
                    .font(.system(size: 10))
                    .padding(.bottom, 8)
                Text(movie.releaseDate)
                    .font(.system(size: 10))
                    .padding(.bottom, 8)
                Spacer()
            }
            .padding(.top, 4)
            .padding(.horizontal, 8)
            Spacer()
        }
        .padding(.vertical, 4)
    }
}
