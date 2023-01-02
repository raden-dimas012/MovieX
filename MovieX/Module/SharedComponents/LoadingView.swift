//
//  LoadingView.swift
//  MovieX
//
//  Created by Raden Dimas on 10/12/22.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        GeometryReader { geometry in
            VStack {
                ProgressView("Loading")
            }
            .frame(width: geometry.size.width)
            .frame(minHeight: geometry.size.height)
        }
    }
}
