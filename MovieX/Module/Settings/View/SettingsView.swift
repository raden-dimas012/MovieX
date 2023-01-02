//
//  SettingsView.swift
//  MovieX
//
//  Created by Raden Dimas on 19/12/22.
//

import SwiftUI

struct SettingsView: View {
    @Binding var darkModeEnabled: Bool
    var body: some View {
        Form {
            Section(header: Text("Dark Mode"),
                    footer: Text("Switch the button toggle for implementing dark mode.")) {
                Toggle(isOn: $darkModeEnabled, label: {
                    Image(systemName: "moon.circle")
                    Text("Dark Mode")
                }).onChange(of: darkModeEnabled, perform: { _ in
                    self.darkModeEnabled.toggle()
                })
            }
        }
    }
}
