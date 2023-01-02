//
//  Helper.swift
//  MovieX
//
//  Created by Raden Dimas on 10/12/22.
//

import Foundation

final class Helper {
    static func returnNavBarTitle(tabSelection: Tabs) -> String {
        switch tabSelection {
        case .home: return "Home"
        case .search: return "Search"
        case .favorite: return "Favorite"
        case .about: return "About"
        case .settings: return "Settings"
        }
    }
    static func getGenreMovies(genreID: [Int]) -> [String] {
        var stringResult: [String] = []
        for name in genreID {
            switch name {
            case 28:
                stringResult.append("Action")
            case 12:
                stringResult.append("Adventure")
            case 16:
                stringResult.append("Animation")
            case 35:
                stringResult.append("Comedy")
            case 80:
                stringResult.append("Crime")
            case 99:
                stringResult.append("Documentary")
            case 18:
                stringResult.append("Drama")
            case 10751:
                stringResult.append("Family")
            case 14:
                stringResult.append("Fantasy")
            case 36:
                stringResult.append("History")
            case 27:
                stringResult.append("Horror")
            case 10402:
                stringResult.append("Music")
            case 9648:
                stringResult.append("Mystery")
            case 10749:
                stringResult.append("Romance")
            case 878:
                stringResult.append("Science Fiction")
            case 10770:
                stringResult.append("TV Movie")
            case 53:
                stringResult.append("Thriller")
            case 10752:
                stringResult.append("War")
            case 37:
                stringResult.append("Western")
            default:
                stringResult.append("-")
            }
        }
        return stringResult
    }
    static func getDetailGenres(genres: [GenreModel]) -> String {
        var arrayGenre: [String] = []
        for genre in genres {
            arrayGenre.append(genre.title)
        }
        return arrayGenre.joined(separator: ", ")
    }
}
