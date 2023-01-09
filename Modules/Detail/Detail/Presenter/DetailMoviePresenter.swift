//
//  DetailPresenter.swift
//  MovieX
//
//  Created by Raden Dimas on 11/12/22.
//

import SwiftUI
import Combine
import Core

public final class DetailMoviePresenter: ObservableObject {
    private let router = DetailMovieRouter()
    private let detailUseCase: DetailUseCase
    private var cancellables: Set<AnyCancellable> = []
    @Published var detailMovie: DetailMovieModel?
    @Published var similarMovie: [SimilarMovieModel]?
    @Published var presenterState: PresenterState = .none
    @Published var isFavorite: Bool = false
    @Published var showFavoriteAlert: Bool = false
    @Published var favoriteAlert: FavoriteAlerts = .none
    @Published var alertMessage: String = ""
    @Published var errorMessage: String = ""
    @Published var isDarkMode: Bool = false
    public init(detailUseCase: DetailUseCase) {
        self.detailUseCase = detailUseCase
    }
    deinit {
        self.cancellables.removeAll()
    }
    func getDetailMovie() {
        presenterState = .loading
        detailUseCase.getMovieDetail()
            .receive(on: RunLoop.main)
            .sink { [weak self] (completion) in
                switch completion {
                case .failure(let error):
                    guard let self = self else {return}
                    self.errorMessage = error.localizedDescription
                    self.presenterState = .failed
                case .finished:
                    break
                }
            } receiveValue: { [weak self] (movie) in
                guard let self = self else {return}
                self.presenterState = .loaded
                self.detailMovie = movie
                self.checkMovieIsFavorite()
            }
            .store(in: &cancellables)
    }
    func getSimilarMovie() {
        presenterState = .loading
        detailUseCase.getSimilarMovieDetail()
            .receive(on: RunLoop.main)
            .sink { [weak self] (completion) in
                switch completion {
                case .failure(let error):
                    guard let self = self else {return}
                    self.presenterState = .failed
                    self.errorMessage = error.localizedDescription
                case .finished:
                    break
                }
            } receiveValue: { [weak self] (movies) in
                guard let self = self else {return}
                self.presenterState = .loaded
                self.similarMovie = movies
            }
            .store(in: &cancellables)
    }
    func checkMovieIsFavorite() {
        guard let detailMovie = detailMovie else {return}
        detailUseCase.getMovieIsFavorite(withId: detailMovie.id)
            .receive(on: RunLoop.main)
            .sink { [weak self] (completion) in
                switch completion {
                case .failure(let error):
                    guard let self = self else {return}
                    self.isFavorite = false
                    self.errorMessage = error.localizedDescription
                case .finished:
                    break
                }
            } receiveValue: { [weak self] (isFavorite) in
                guard let self = self else {return}
                self.isFavorite = isFavorite
            }
            .store(in: &cancellables)
    }
    func addMovieToFavorite() {
        guard let detailMovie = detailMovie else {return}
        detailUseCase.addMovieToFavorite(input: detailMovie)
            .receive(on: RunLoop.main)
            .sink { [weak self] (completion) in
                switch completion {
                case .failure(let error):
                    guard let self = self else {return}
                    self.showFavoriteAlert = true
                    self.errorMessage = error.localizedDescription
                case .finished:
                    break
                }
            } receiveValue: { [weak self] _ in
                guard let self = self else {return}
                self.showFavoriteAlert = true
                self.checkMovieIsFavorite()
            }
            .store(in: &cancellables)
    }
    func removeMovieFromFavorite() {
        guard let detailMovie = detailMovie else {return}
        detailUseCase.removeMovieFromFavorite(withId: detailMovie.id)
            .receive(on: RunLoop.main)
            .sink { [weak self] (completion) in
                switch completion {
                case .failure(let error):
                    guard let self = self else {return}
                    self.showFavoriteAlert = true
                    self.errorMessage = error.localizedDescription
                case .finished:
                    break
                }
            } receiveValue: { [weak self] _ in
                guard let self = self else {return}
                self.showFavoriteAlert = true
                self.checkMovieIsFavorite()
            }
            .store(in: &cancellables)
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
