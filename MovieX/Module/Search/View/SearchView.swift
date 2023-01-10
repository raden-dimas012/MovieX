//
//  SearchView.swift
//  MovieX
//
//  Created by Raden Dimas on 10/01/23.
//

import SwiftUI
import MovieXUI

public struct SearchView: View {
    var darkModeEnabled: Bool
    @ObservedObject var presenter: SearchPresenter
    public init(@State darkModeEnabled: Bool, presenter: SearchPresenter) {
        self.darkModeEnabled = darkModeEnabled
        self.presenter = presenter
    }
    public var body: some View {
        ZStack {
            switch presenter.presenterState {
            case .none:
                CustomErrorView(title: "Please Search Your Movie....")
            case .loading:
                LoadingView()
            case .loaded:
                createSearchListView()
            case .failed:
                CustomErrorView(title: "Data Not Found....")
            }
        }
        .searchable(text: self.$presenter.query)
        .onAppear {
            self.presenter.isDarkMode = darkModeEnabled
        }
    }
}

extension SearchView {
    @ViewBuilder
    private func createSearchListView() -> some View {
        List {
            ForEach(presenter.searchMovies) { movie in
                ZStack {
                    self.presenter.linkBuilder(for: movie.id, isDarkMode: presenter.isDarkMode) {
                        MovieListCardView(movie: movie)
                    }.buttonStyle(PlainButtonStyle())
                }.padding(8)
                if movie == presenter.searchMovies.last {
                    LoadingView()
                        .padding(.bottom, 15)
                        .onAppear {
                            DispatchQueue.main.async {
                                presenter.isPagination = true
                                presenter.currentPage += 1
                                presenter.getSearchedMovies(page: presenter.currentPage, query: presenter.query)
                            }
                        }
                }
            }
        }
        .listStyle(.plain)
    }
}
