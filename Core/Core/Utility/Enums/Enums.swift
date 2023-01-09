//
//  Enums.swift
//  MovieX
//
//  Created by Raden Dimas on 10/12/22.
//

import Foundation

public enum Tabs {
    case home, search, favorite, about, settings
}
public enum Theme {
    static let isNotDarkMode = false
    static let isDarkMode = true
}
public enum FavoriteAlerts {
    case none, addToFavorite, removeFromFavorite, failed
}
public enum TextFieldAlert {
    case checkingDataAlert, checkingTexfieldAlert
}
public enum PresenterState {
    case none, loading, loaded, failed
}
