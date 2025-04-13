//
//  TabBarView.swift
//  Moviemax
//
//  Created by Gerodot on 13.04.2025.
//

import SwiftUI

struct TabBarView: View {
    private var tabs = TabBarItem.allCases
    @State private var selectedTab = 2
    @State private var showOnboarding: Bool = false
    @AppStorage("isOnboardingIsCompleated")
    var isOnboardingIsCompleated: Bool = false

    var body: some View {
        TabView(selection: $selectedTab) {
            ForEach(tabs.indices, id: \.self) { index in
                NavigationStack {
                    tabs[index].view
                }
                .tabItem {
                    Image(
                        selectedTab == index
                        ? "\(tabs[index].iconName)Active"
                        : "\(tabs[index].iconName)"
                    )
                }
                .accessibilityLabel(tabs[index].title)
                .tag(index)
            }
        }
        .labelsHidden()
        .fullScreenCover(isPresented: $showOnboarding) {
            OnboardingView()
        }
        .onAppear {
            // обращаемся за данными пользователя и передаем из в окружении
        }
    }
}

#Preview {
    TabBarView()
}
