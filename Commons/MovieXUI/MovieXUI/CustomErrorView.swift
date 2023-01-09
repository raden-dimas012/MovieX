//
//  CustomErrorView.swift
//  MovieX
//
//  Created by Raden Dimas on 26/12/22.
//

import SwiftUI
import Core

public struct CustomErrorView: View {
    let title: String
    public init(title: String) {
        self.title = title
    }
    public var body: some View {
        VScrollView {
            ZStack(alignment: .bottom) {
                CustomViewAnimation(jsonFile: "not-found")
                    .frame(width: 350, height: 400)
                Text(title)
                    .foregroundColor(.gray)
                    .font(.title)
            }
        }
    }
}
