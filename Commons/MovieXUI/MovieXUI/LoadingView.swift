//
//  LoadingView.swift
//  MovieX
//
//  Created by Raden Dimas on 10/12/22.
//

import SwiftUI

public struct LoadingView: View {
    public init() {}
    public var body: some View {
        GeometryReader { geometry in
            VStack {
                ProgressView("Loading")
            }
            .frame(width: geometry.size.width)
            .frame(minHeight: geometry.size.height)
        }
    }
}
