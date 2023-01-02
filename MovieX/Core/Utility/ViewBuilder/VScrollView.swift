//
//  DetailViewBuilder.swift
//  MovieX
//
//  Created by Raden Dimas on 18/12/22.
//

import SwiftUI

struct VScrollView<Content>: View where Content: View {
  @ViewBuilder let content: Content
  var body: some View {
    GeometryReader { geometry in
        ScrollView(showsIndicators: false) {
        content
          .frame(width: geometry.size.width)
          .frame(minHeight: geometry.size.height)
      }
    }
  }
}
