//
//  SettingsView.swift
//  MovieX
//
//  Created by Raden Dimas on 10/01/23.
//

import SwiftUI

public struct SettingsView: View {
    @Binding var darkModeEnabled: Bool
    public init(darkModeEnabled: Binding<Bool>) {
        self._darkModeEnabled = darkModeEnabled
    }
    public var body: some View {
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
