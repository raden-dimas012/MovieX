//
//  FavoritePresenter.swift
//  MovieX
//
//  Created by Raden Dimas on 29/12/22.
//

import SwiftUI
import Combine

final class FavoritePresenter: ObservableObject {
    private let router = FavoriteRouter()
    private let favoriteUseCase: FavoriteUseCase
    private var cancellables: Set<AnyCancellable> = []
    @Published var movies: [MovieModel] = []
    @Published var errorMessage: String = ""
    @Published var presenterState: PresenterState = .none
    @Published var isDarkMode: Bool = false
    init(favoriteUseCase: FavoriteUseCase) {
        self.favoriteUseCase = favoriteUseCase
    }
    deinit {
        self.cancellables.removeAll()
    }
    func getFavoriteMovies() {
        presenterState = .loading
        favoriteUseCase.getFavoriteMovies()
            .sink { [weak self] (completion) in
                switch completion {
                case .failure(let error):
                    guard let self = self else {return}
                    self.errorMessage = error.localizedDescription
                    self.presenterState = .failed
                case .finished:
                    break
                }
            } receiveValue: { [weak self] (movies) in
                guard let self = self else {return}
                if movies.isEmpty {
                    self.presenterState = .none
                } else {
                    self.presenterState = .loaded
                }
                self.movies = movies
            }.store(in: &cancellables)
    }
    func linkBuilder<Content: View>(
        for movieId: Int,
        isDarkMode state: Bool,
        @ViewBuilder content: () -> Content
    ) -> some View {
        NavigationLink(
            destination: router.navigateToDetailView(for: movieId, isDarkMode: state)) {content()}
    }
}
