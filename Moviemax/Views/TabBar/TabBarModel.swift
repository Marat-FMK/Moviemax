//
//  TabInfo.swift
//  TeamChallenge2
//
//  Created by Gerodot on 12.03.2025.
//

import SwiftUI

struct AnyTabView: View {
    private let _body: AnyView
    
    init<V: View>(_ view: V) {
        _body = AnyView(view)
    }
    
    var body: some View {
        _body
    }
}

struct TabBarItem {
    let title: String
    let iconName: String
    let view: AnyTabView
}

extension TabBarItem {
    static var allCases: [TabBarItem] = [
        TabBarItem(
            title: "Search",
            iconName: "SearchView",
            view: AnyTabView(SearchView())
        ),
        TabBarItem(
            title: "Recent",
            iconName: "RecentView",
            view: AnyTabView(RecentWatchView())
        ),
        TabBarItem(
            title: "Main",
            iconName: "MainView",
            view: AnyTabView(MainView())
        ),
        TabBarItem(
            title: "Favorites",
            iconName: "FavoritesView",
            view: AnyTabView(FavoritesView())
        ),
        TabBarItem(
            title: "Profile",
            iconName: "ProfileView",
            view: AnyTabView(Text("Profile"))
        ),
    ]
}
