//
//  HomeView.swift
//  MovieX
//
//  Created by Raden Dimas on 10/12/22.
//

import SwiftUI
import Core
import MovieXUI

public struct HomeView: View {
    var darkModeEnabled: Bool
    @ObservedObject var presenter: HomePresenter
    public init(@State darkModeEnabled: Bool,presenter: HomePresenter) {
        self.presenter = presenter
        self.darkModeEnabled = darkModeEnabled
    }
    public var body: some View {
        VScrollView {
            VStack(spacing: 0) {
                switch presenter.presenterState {
                case .none:
                    CustomErrorView(title: "Something Went Wrong....")
                case .loading:
                    LoadingView()
                case .loaded:
                    createNowPlayingView()
                    createCategoryView()
                    if !presenter.isGenreSelected && !presenter.movies.isEmpty {
                        createMovieListView()
                    } else {
                        LoadingView()
                    }
                    Spacer()
                case .failed:
                    CustomErrorView(title: "Failed Get Data....")
                }
            }
        }
        .onAppear {
            self.presenter.isDarkMode = darkModeEnabled
            if self.presenter.genres.isEmpty {
                self.presenter.getGenres()
            }
            if self.presenter.movies.isEmpty {
                self.presenter.getMovies(page: presenter.currentPage, genreId: presenter.selectedGenre)
            }
            if self.presenter.nowPlaying.isEmpty {
                self.presenter.getNowPlaying()
            }
        }
    }
}

extension HomeView {
    @ViewBuilder
    private func createNowPlayingView() -> some View {
        Text("Now Playing")
            .font(.title2)
            .fontWeight(.bold)
            .padding(.leading, 16)
            .padding(.vertical, 8)
            .frame(maxWidth: .infinity, alignment: .leading)
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack {
                ForEach(presenter.nowPlaying) { movie in
                    ZStack {
                        self.presenter.linkBuilder(for: movie.id,
                                                   isDarkMode: presenter.isDarkMode) {
                            MoviePlayingNowView(movie: movie)
                        }.buttonStyle(PlainButtonStyle())
                    }
                }
            }
            .padding(.vertical, 4)
            .padding(.horizontal, 16)
        }.frame(height: 125, alignment: .top)
    }
    @ViewBuilder
    private func createCategoryView() -> some View {
        Text("Categories")
            .font(.title2)
            .fontWeight(.bold)
            .padding(.leading, 16)
            .padding(.vertical, 16)
            .frame(maxWidth: .infinity, alignment: .leading)
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack {
                ForEach(presenter.genres) { genre in
                    CategoryView(isDarkMode: $presenter.isDarkMode,
                                 genre: genre,
                                 isSelected: presenter.selectedGenre == genre.id
                    )
                        .environmentObject(presenter)
                }
            }
            .padding(.vertical, 4)
            .padding(.horizontal, 16)
        }
        .frame(height: 35, alignment: .top)
    }
    @ViewBuilder
    private func createMovieListView() -> some View {
        LazyVStack {
            ForEach(presenter.movies) { movie in
                ZStack {
                    self.presenter.linkBuilder(for: movie.id, isDarkMode: presenter.isDarkMode) {
                        MovieListCardView(movie: movie)
                    }.buttonStyle(PlainButtonStyle())
                }.padding(8)
                Divider()
                if movie == presenter.movies.last {
                    LoadingView()
                        .padding(.bottom, 15)
                        .onAppear {
                            DispatchQueue.main.async {
                                presenter.isPagination = true
                                presenter.currentPage += 1
                                presenter.getMovies(page: presenter.currentPage, genreId: presenter.selectedGenre)
                            }
                        }
                }
            }
        }
        .padding(.horizontal, 8)
    }
}
