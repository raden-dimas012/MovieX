//
//  SearchRouter.swift
//  MovieX
//
//  Created by Raden Dimas on 25/12/22.
//

import SwiftUI
import Core
import Detail

public final class SearchRouter {
    func navigateToDetailView(for movieId: Int, isDarkMode state: Bool) -> some View {
        let detailUseCase = Injection.init().provideDetail(movieId: movieId)
        let presenter = DetailMoviePresenter(detailUseCase: detailUseCase)
        return DetailMovieView(darkModeEnabled: state, presenter: presenter)
    }
}
