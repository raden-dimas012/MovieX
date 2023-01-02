//
//  SearchPresenter.swift
//  MovieX
//
//  Created by Raden Dimas on 25/12/22.
//

import SwiftUI
import Combine

final class SearchPresenter: ObservableObject {
    private let router = SearchRouter()
    private let searchUseCase: SearchUseCase
    private var cancellables: Set<AnyCancellable> = []
    @Published var searchMovies: [MovieModel] = []
    @Published var presenterState: PresenterState = .none
    @Published var isPagination: Bool = false
    @Published var errorMessage: String = ""
    @Published var currentPage: Int = 1
    @Published var query: String = ""
    @Published var isDarkMode: Bool = false
    init(searchUseCase: SearchUseCase) {
        self.searchUseCase = searchUseCase
        self.initObserverSearchBar()
    }
    deinit {
        self.cancellables.removeAll()
    }
    private func initObserverSearchBar() {
        $query
            .removeDuplicates()
            .debounce(for: .milliseconds(500), scheduler: RunLoop.main)
            .sink { [weak self] (query) in
                guard let self = self else {return}
                if !self.query.isEmpty {
                    self.getSearchedMovies(page: self.currentPage, query: query)
                } else {
                    self.presenterState = .none
                }
            }.store(in: &cancellables)
    }
    func getSearchedMovies(page: Int, query: String) {
        if !isPagination {
            presenterState = .loading
        } else {
            presenterState = .loaded
        }
        self.searchUseCase.getSearchedMovies(page: page, query: query)
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
                if movies.isEmpty {
                    self.presenterState = .failed
                } else {
                    self.presenterState = .loaded
                    self.searchMovies = movies
                }
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
