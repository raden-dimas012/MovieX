//
//  HomePresenter.swift
//  MovieX
//
//  Created by Raden Dimas on 10/12/22.
//

import SwiftUI
import Combine

final class HomePresenter: ObservableObject {
    private let router = HomeRouter()
    private let homeUseCase: HomeUseCase
    private var cancellables: Set<AnyCancellable> = []
    @Published var genres: [GenreModel] = []
    @Published var nowPlaying: [NowPlayingModel] = []
    @Published var movies: [MovieModel] = []
    @Published var errorMessage: String = ""
    @Published var presenterState: PresenterState = .none
    @Published var selectedGenre: Int = 28
    @Published var currentPage: Int = 1
    @Published var isPagination: Bool = false
    @Published var isGenreSelected: Bool = false
    @Published var isDarkMode: Bool = false
    init(homeUseCase: HomeUseCase) {
        self.homeUseCase = homeUseCase
    }
    deinit {
        self.cancellables.removeAll()
    }
    func getNowPlaying() {
        presenterState = .loading
        homeUseCase.getMoviesNowPlaying()
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
            } receiveValue: { [weak self] (movies) in
                guard let self = self else {return}
                self.presenterState = .loaded
                self.nowPlaying = movies
            }
            .store(in: &cancellables)
    }
    func getGenres() {
        presenterState = .loading
        homeUseCase.getGenres()
            .receive(on: RunLoop.main)
            .sink { [weak self] (completion) in
                switch completion {
                case .failure(let error):
                    guard let self = self else {return}
                    self.errorMessage = error.localizedDescription
                    self.presenterState = .failed
                case .finished:
                    guard let self = self else {return}
                    self.presenterState = .loaded
                }
            } receiveValue: { [weak self] (genres) in
                guard let self = self else {return}
                self.genres = genres
            }
            .store(in: &cancellables)
    }
    func getMovies(page: Int, genreId: Int) {
        if !isPagination && !isGenreSelected {
            presenterState = .loading
        } else {
            presenterState = .loaded
        }
        homeUseCase.getMovies(page: page, genreId: genreId)
            .receive(on: RunLoop.main)
            .sink { [weak self] (completion) in
                switch completion {
                case .failure(let error):
                    guard let self = self else {return}
                    self.errorMessage = error.localizedDescription
                    self.presenterState = .failed
                    self.isPagination = false
                    self.isGenreSelected = false
                case .finished:
                    guard let self = self else {return}
                    self.presenterState = .loaded
                }
            } receiveValue: { [weak self] (movies) in
                guard let self = self else {return}
                self.movies.append(contentsOf: movies)
                self.isPagination = false
                self.isGenreSelected = false
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
