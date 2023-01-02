//
//  CategoryView.swift
//  MovieX
//
//  Created by Raden Dimas on 10/12/22.
//

import SwiftUI

struct CategoryView: View {
    @Namespace private var animation
    @EnvironmentObject var presenter: HomePresenter
    @State var isDarkMode: Bool
    let genre: GenreModel
    let isSelected: Bool
    var body: some View {
        Text(genre.title)
            .font(.callout)
            .fontWeight(.semibold)
            .scaleEffect(0.9)
            .foregroundColor(
                isDarkMode ? presenter.selectedGenre == genre.id ? .black : .white
                : presenter.selectedGenre == genre.id ? .white : .black)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 8)
            .padding(.horizontal, 16)
            .background {
                if presenter.selectedGenre == genre.id {
                    Capsule()
                        .fill(isDarkMode ? .gray : .black)
                        .matchedGeometryEffect(id: "TAB", in: animation)
                }
            }
            .contentShape(Capsule())
            .onTapGesture {
                withAnimation {
                    presenter.selectedGenre = genre.id
                    presenter.movies.removeAll()
                    presenter.isPagination = false
                    presenter.isGenreSelected = true
                    presenter.currentPage = 1
                    presenter.getMovies(page: presenter.currentPage, genreId: presenter.selectedGenre)
                }
            }
    }
}
