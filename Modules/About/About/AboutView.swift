//
//  AboutView.swift
//  MovieX
//
//  Created by Raden Dimas on 19/12/22.
//

import SwiftUI
import MovieXUI

public struct AboutView: View {
    public init() {}
    public var body: some View {
        VScrollView {
            createImageView()
            createProfileView()
            Spacer()
        }
    }
}

extension AboutView {
    @ViewBuilder
    private func createImageView() -> some View {
        Image("MyPhoto")
            .resizable()
            .frame(width: 175, height: 175)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 4))
            .shadow(radius: 5)
            .padding(.bottom, 12)
    }
    @ViewBuilder
    private func createProfileView() -> some View {
        VStack {
            createContentProfile(
                headerText: "Name",
                imageName: "person.circle",
                profileText: "Raden Dimas"
            )
            createContentProfile(
                headerText: "Birth Day",
                imageName: "calendar.circle",
                profileText: "Jun 06,2000"
            )
            createContentProfile(
                headerText: "Email",
                imageName: "envelope.circle",
                profileText: "dimascode012@gmail.com"
            )
            createContentProfile(
                headerText: "Role",
                imageName: "bag.fill",
                profileText: "iOS Engineer"
            )
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 12)
    }
    @ViewBuilder
    private func createContentProfile(
        headerText: String,
        imageName: String,
        profileText: String
    ) -> some View {
        Section(header: Text(headerText)
            .font(.title)
            .bold()
        ) {
            HStack {
                Image(systemName: imageName)
                    .font(.title)
                Text(profileText)
                    .font(.title2)
                    .lineLimit(2)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, 20)
        .padding(.bottom, 12)
    }
}
