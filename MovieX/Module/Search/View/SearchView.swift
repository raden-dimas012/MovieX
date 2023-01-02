//
//  SearchView.swift
//  MovieX
//
//  Created by Raden Dimas on 19/12/22.
//

import SwiftUI

struct SearchView: View {
    @Binding var darkModeEnabled: Bool
    @ObservedObject var presenter: SearchPresenter
    var body: some View {
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
