//
//  DetailViewBuilder.swift
//  MovieX
//
//  Created by Raden Dimas on 18/12/22.
//

import SwiftUI

public struct VScrollView<Content>: View where Content: View {
    let content: Content
    public init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    public var body: some View {
        GeometryReader { geometry in
            ScrollView(showsIndicators: false) {
                content
                    .frame(width: geometry.size.width)
                    .frame(minHeight: geometry.size.height)
            }
        }
    }
}
