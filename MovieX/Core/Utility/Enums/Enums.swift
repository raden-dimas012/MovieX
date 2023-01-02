//
//  Enums.swift
//  MovieX
//
//  Created by Raden Dimas on 10/12/22.
//

import Foundation

enum Tabs {
    case home, search, favorite, about, settings
}
enum Theme {
    static let isNotDarkMode = false
    static let isDarkMode = true
}
enum FavoriteAlerts {
    case none, addToFavorite, removeFromFavorite, failed
}
enum TextFieldAlert {
    case checkingDataAlert, checkingTexfieldAlert
}
enum PresenterState {
    case none, loading, loaded, failed
}
