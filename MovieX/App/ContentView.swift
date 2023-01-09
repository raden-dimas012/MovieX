//
//  ContentView.swift
//  MovieX
//
//  Created by Raden Dimas on 09/12/22.
//

import SwiftUI
import Home
import Core
import Favorite
import About
import Settings
import Search

struct ContentView: View {
    @EnvironmentObject var homePresenter: HomePresenter
    @EnvironmentObject var searchPresenter: SearchPresenter
    @EnvironmentObject var favoritePresenter: FavoritePresenter
    @AppStorage("darkModeEnabled") var darkModeEnabled: Bool = false
    @State var tabSelection: Tabs = .home
    var body: some View {
        TabView(selection: $tabSelection) {
            NavigationStack {
                HomeView(darkModeEnabled: darkModeEnabled, presenter: homePresenter)
                    .navigationTitle(Helper.returnNavBarTitle(tabSelection: self.tabSelection))
            }
            .tabItem {
                Label {
                    Text("Home")
                } icon: {
                    Image(systemName: "house.fill")
                }
            }
            .tag(Tabs.home)
            NavigationStack {
                SearchView(darkModeEnabled: darkModeEnabled, presenter: searchPresenter)
                    .navigationTitle(Helper.returnNavBarTitle(tabSelection: self.tabSelection))
            }
            .tabItem {
                Label {
                    Text("Search")
                } icon: {
                    Image(systemName: "magnifyingglass.circle")
                }
            }
            .tag(Tabs.search)
            NavigationStack {
                FavoriteView(darkModeEnabled: darkModeEnabled, presenter: favoritePresenter)
                    .navigationTitle(Helper.returnNavBarTitle(tabSelection: self.tabSelection))
            }
            .tabItem {
                Label {
                    Text("Favorite")
                } icon: {
                    Image(systemName: "heart.circle")
                }
            }
            .tag(Tabs.favorite)
            NavigationStack {
                AboutView()
                    .navigationTitle(Helper.returnNavBarTitle(tabSelection: self.tabSelection))

            }
            .tabItem {
                Label {
                    Text("About")
                } icon: {
                    Image(systemName: "person.circle.fill")
                }
            }
            .tag(Tabs.about)
            NavigationStack {
                SettingsView(darkModeEnabled: $darkModeEnabled)
                    .navigationTitle(Helper.returnNavBarTitle(tabSelection: self.tabSelection))
            }
            .tabItem {
                Label {
                    Text("Settings")
                } icon: {
                    Image(systemName: "gearshape")
                }
            }
            .tag(Tabs.settings)
        }
        .tint(darkModeEnabled ? .gray : .black)
    }
}
