//
//  FavoriteView.swift
//  MovieX
//
//  Created by Raden Dimas on 10/01/23.
//

import SwiftUI
import MovieXUI

public struct FavoriteView: View {
    var darkModeEnabled: Bool
    @ObservedObject var presenter: FavoritePresenter
    public init(@State darkModeEnabled: Bool, presenter: FavoritePresenter) {
        self.darkModeEnabled = darkModeEnabled
        self.presenter = presenter
    }
    public var body: some View {
        VScrollView {
            switch presenter.presenterState {
            case .none:
                CustomErrorView(title: "No Favorite Movie ....")
            case .loading:
                LoadingView()
            case .loaded:
                createFavoriteListView()
                Spacer()
            case .failed:
                CustomErrorView(title: "Something Went Wrong ....")
            }
        }.onAppear {
            self.presenter.getFavoriteMovies()
            self.presenter.isDarkMode = darkModeEnabled
        }
    }
}

extension FavoriteView {
    @ViewBuilder
    private func createFavoriteListView() -> some View {
        LazyVStack {
            ForEach(presenter.movies) { movie in
                ZStack {
                    self.presenter.linkBuilder(for: movie.id, isDarkMode: presenter.isDarkMode) {
                        FavoriteListCardView(movie: movie)
                    }.buttonStyle(PlainButtonStyle())
                }.padding(8)
                Divider()
            }
        }
        .padding(.horizontal, 8)
    }
}
