//
//  AppNavigations.swift
//  MovieX
//
//  Created by Raden Dimas on 10/01/23.
//

import SwiftUI

public final class AppNavigations {
    public static let shared = AppNavigations()
    public func navigateToDetailView(for movieId: Int, isDarkMode state: Bool) -> some View {
        let detailUseCase = Injection.init().provideDetail(movieId: movieId)
        let presenter = DetailPresenter(detailUseCase: detailUseCase)
        return DetailMovieView(darkModeEnabled: state, presenter: presenter)
    }
}
