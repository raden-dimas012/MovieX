//
//  CustomErrorView.swift
//  MovieX
//
//  Created by Raden Dimas on 26/12/22.
//

import SwiftUI

struct CustomErrorView: View {
    let title: String
    var body: some View {
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
