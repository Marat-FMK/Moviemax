//
//  OnboardingView.swift
//  Moviemax
//
//  Created by Julia Martcenko on 01/04/2025.
//

import SwiftUI

struct OnboardingView: View {
	let pages = [
		(image: "onboarding_1", title: "Discover & Stream Your Favorite Movies", description: "Browse a vast collection of blockbuster hits, indie gems, and timeless classics—all in one place.", buttonName: "Continue"),
		(image: "onboarding_2", title: "Explore Curated Lists & Trending Picks", description: "Browse through popular films, top-rated classics, and specially curated collections to discover something great to watch.", buttonName: "Continue"),
		(image: "onboarding_3", title: "Stay Updated on Upcoming Releases", description: "Set reminders, watch trailers, and be the first to know when the latest movies hit the screen.", buttonName: "Start")
		]
	@State private var currentPage = 0

	var body: some View {
		TabView(selection: $currentPage) {
			ForEach(0..<pages.count, id: \.self) { index in
				ZStack {
					Color.onboardingBackground
						.edgesIgnoringSafeArea(.all)
					GeometryReader { geometry in
						VStack(spacing: 0) {
							Image(pages[index].image)
								.resizable()
								.scaledToFill()
								.frame(width: geometry.size.width, height: geometry.size.height * 1 / 2)
							ZStack {
								RoundedRectangle(cornerRadius: 16)
									.fill(.whiteBackground)
								VStack{
									ScrollerIndicatorView(currentIndex: currentPage)
										.padding(.top, 28)
									Spacer()
									Text(pages[index].title)
										.fontWeight(.bold)
										.customFont(name: .plusJacartaBold, size: 24)
										.padding(.bottom, 8)
										.multilineTextAlignment(.center)
										.padding(.horizontal, 48)
									Text(pages[index].description)
										.foregroundStyle(.subtextGray)
										.multilineTextAlignment(.center)
										.padding(.horizontal, 48)
										.customFont(name: .plusJacartaRegular, size: 14)
									Spacer()
									MiddleButtonView(action: {
										if currentPage < pages.count - 1 {
											currentPage += 1
										} else {

										}
									}, label: pages[index].buttonName)
									.padding(.bottom, 28)
									.padding(.horizontal, 88)
								}
							}
							.padding(.horizontal, 24)
							.frame(maxWidth: .infinity, maxHeight: .infinity)
						}
						.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
					}
				}
				.tag(index)

			}
		}
		.tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
		.edgesIgnoringSafeArea(.all)
	}
}

#Preview {
    OnboardingView()
}
