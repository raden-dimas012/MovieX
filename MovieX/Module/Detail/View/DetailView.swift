//
//  DetailView.swift
//  MovieX
//
//  Created by Raden Dimas on 10/01/23.
//

import SwiftUI
import Kingfisher
import Core
import MovieXUI
import Common

public struct DetailMovieView: View {
    @State var darkModeEnabled: Bool
    @ObservedObject var presenter: DetailPresenter
    public init(darkModeEnabled: Bool, presenter: DetailPresenter) {
        self.darkModeEnabled = darkModeEnabled
        self.presenter = presenter
    }
    public var body: some View {
        VScrollView {
            VStack(spacing: 0) {
                switch presenter.presenterState {
                case .none:
                    EmptyView()
                case .loading:
                    LoadingView()
                case .loaded:
                    createTopImageView()
                    createContentView()
                    createDetailContentView()
                    createButtonView()
                    createSimilarListView()
                case .failed:
                    EmptyView()
                }
            }
        }
        .toolbar(.hidden, for: .tabBar)
        .onAppear {
            self.presenter.isDarkMode = darkModeEnabled
            self.presenter.getDetailMovie()
            self.presenter.getSimilarMovie()
            self.presenter.checkMovieIsFavorite()
        }
        .navigationBarTitle(Text("Detail Movie"), displayMode: .inline)
    }
}

extension DetailMovieView {
    @ViewBuilder
    private func createTopImageView() -> some View {
        KFImage.url(URL(string: API.baseImageUrl + (presenter.detailMovie?.backdropPath ?? "")))
            .resizable()
            .cacheMemoryOnly()
            .onSuccess { success in
                debugPrint("success: \(success)")
            }
            .onFailure { error in
                debugPrint("error: \(error)")
            }
            .placeholder { progress in
                ProgressView(progress).frame(maxWidth: .infinity).frame(height: 250)
            }
            .cancelOnDisappear(true)
            .fade(duration: 0.35)
            .frame(maxWidth: .infinity)
            .frame(height: 300)
            .padding(.top, 15)
    }
    @ViewBuilder
    private func createContentView() -> some View {
        HStack {
            KFImage.url(URL(string: API.baseImageUrl + (presenter.detailMovie?.posterPath ?? "")))
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
                .frame(width: 125, height: 175)
                .cornerRadius(25)
                .shadow(radius: 5)
                .padding(.top, -50)
            VStack(alignment: .leading, spacing: 8) {
                Text(presenter.detailMovie?.voteAverage.toString() ?? "")
                    .font(.system(size: 16))
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .padding(.top, 10)
                Text(presenter.detailMovie?.title ?? "")
                    .font(.system(size: 18))
                    .bold()
                Text(Helper.getDetailGenres(genres: presenter.detailMovie?.genres ?? []))
                    .lineLimit(2)
                    .multilineTextAlignment(.leading)
                    .font(.system(size: 14))
                    .bold()
                    .frame(height: 40)
                Text(presenter.detailMovie?.releaseDate ?? "")
                    .font(.system(size: 14))
                    .bold()
            }
            .padding(.top, -10)
        }
        .padding(.horizontal, 8)
    }
    @ViewBuilder
    private func createDetailContentView() -> some View {
        Text("Tagline")
            .font(.system(size: 24))
            .fontWeight(.bold)
            .padding(.top, 10)
            .padding(.leading, 15)
            .frame(maxWidth: .infinity, alignment: .leading)
        Text(presenter.detailMovie?.tagline ?? "")
            .font(.system(size: 20))
            .italic()
            .fontWeight(.semibold)
            .padding(.leading, 15)
            .padding(.bottom, 10)
            .frame(maxWidth: .infinity, alignment: .leading)
        Text("Overview")
            .font(.system(size: 24))
            .fontWeight(.bold)
            .padding(.leading, 15)
            .frame(maxWidth: .infinity, alignment: .leading)
        Text(presenter.detailMovie?.overview ?? "")
            .font(.system(size: 14))
            .italic()
            .fontWeight(.regular)
            .padding(.horizontal, 15)
            .padding(.bottom, 10)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    @ViewBuilder
    private func createSimilarListView() -> some View {
        Text("Similar Movies")
            .font(.title2)
            .fontWeight(.bold)
            .padding(.leading, 16)
            .padding(.vertical, 8)
            .frame(maxWidth: .infinity, alignment: .leading)
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack {
                ForEach(presenter.similarMovie ?? []) { similarMovie in
                    ZStack {
                        self.presenter.linkBuilder(for: similarMovie.id, isDarkMode: presenter.isDarkMode) {
                            SimilarMovieListCardView(moviePosterPath: similarMovie.posterPath)
                        }.buttonStyle(PlainButtonStyle())
                    }
                }
            }
            .padding(.vertical, 8)
            .padding(.horizontal, 16)
        }.frame(height: 125, alignment: .top)
    }
    @ViewBuilder
    private func createButtonView() -> some View {
        HStack {
            if let link = presenter.detailMovie?.homepage, let url = URL(string: link) {
                Link(destination: url) {
                    HStack {
                        Image(systemName: "link.circle")
                        Text("Visit Website")
                    }
                    .foregroundColor(presenter.isDarkMode ? .black : .white)
                    .padding(12)
                    .background(presenter.isDarkMode ? .gray : .black, in: Capsule())
                }
                .padding(.top, 20)
                .frame(maxWidth: .infinity)
            }
            Button {
                if presenter.isFavorite {
                    presenter.favoriteAlert = .removeFromFavorite
                    presenter.removeMovieFromFavorite()
                } else {
                    presenter.favoriteAlert = .addToFavorite
                    presenter.addMovieToFavorite()
                }
            } label: {
                Label {
                    Text("Add To Favorite")
                } icon: {
                    Image(systemName: presenter.isFavorite ? "heart.fill" : "heart")
                }
                .foregroundColor(presenter.isDarkMode ? .black : .white)
                .padding(12)
                .background(presenter.isDarkMode ? .gray : .black, in: Capsule())
            }
            .padding(.top, 20)
            .frame(maxWidth: .infinity)
            .alert(isPresented: $presenter.showFavoriteAlert) {
                createAlertFavorite()
            }
        }
        .padding(.bottom, 10)
    }
    private func createAlertFavorite() -> Alert {
        switch presenter.favoriteAlert {
        case .none:
            return Alert(
                title: Text("Error"),
                message: Text("Something Went Wrong"),
                dismissButton: .default(Text("Ok"))
            )
        case .addToFavorite:
            return Alert(
                title: Text("Success"),
                message: Text("Data Added To Favorite."),
                dismissButton: .default(Text("Ok"))
            )
        case .removeFromFavorite:
            return Alert(
                title: Text("Success"),
                message: Text("Data Removed From Favorite."),
                dismissButton: .default(Text("Ok"))
            )
        case .failed:
            return Alert(
                title: Text("Failed"),
                message: Text("Data Removed From Favorite."),
                dismissButton: .default(Text("Ok"))
            )
        }
    }
}
