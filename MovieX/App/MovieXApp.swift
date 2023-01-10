//
//  MovieXApp.swift
//  MovieX
//
//  Created by Raden Dimas on 09/12/22.
//

import SwiftUI
import Core

@main
struct MovieXApp: App {
    let homePresenter = HomePresenter(homeUseCase: Injection.init().provideHome())
    let searchPresenter = SearchPresenter(searchUseCase: Injection.init().provideSearch())
    let favoritePresenter = FavoritePresenter(favoriteUseCase: Injection.init().provideFavorite())
    let router = AppNavigations.shared
    @AppStorage("darkModeEnabled") var darkModeEnabled: Bool = false
    var body: some Scene {
        WindowGroup {
            ContentView()
                .preferredColorScheme(darkModeEnabled ? .dark : .light)
                .environmentObject(homePresenter)
                .environmentObject(searchPresenter)
                .environmentObject(favoritePresenter)
        }
    }
}
