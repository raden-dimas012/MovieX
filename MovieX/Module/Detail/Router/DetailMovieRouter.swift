//
//  DetailMovieRouter.swift
//  MovieX
//
//  Created by Raden Dimas on 18/12/22.
//

import SwiftUI

final class DetailMovieRouter {
    func navigateToDetailView(for movieId: Int, isDarkMode state: Bool) -> some View {
        let detailUseCase = Injection.init().provideDetail(movieId: movieId)
        let presenter = DetailMoviePresenter(detailUseCase: detailUseCase)
        return DetailMovieView(darkModeEnabled: state, presenter: presenter)
    }
}
