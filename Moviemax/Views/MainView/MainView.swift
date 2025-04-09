//
//  MainView.swift
//  Moviemax
//
//  Created by Julia Martcenko on 07/04/2025.
//

import SwiftUI

struct MainView: View {
	@StateObject var viewModel: MainViewModel = .init()

	var body: some View {
		NavigationStack {
			VStack(alignment: .leading) {
				HStack {
					Image("profile")
						.resizable()
						.scaledToFill()
						.frame(width: 40, height: 40)
						.clipShape(Circle())
						.clipped()
					VStack(alignment: .leading) {
						Text("Hi, \(viewModel.profile.name)")
							.customFont(name: .plusJacartaBold, size: 18)
							.foregroundStyle(.textBlack)
						Text("only streaming movie lovers")
							.customFont(name: .plusJacartaRegular, size: 12)
							.foregroundStyle(.subtextGray)
					}
				}
				.padding(.horizontal, 24)
				VStack(alignment: .center) {
					CarouselView(images: viewModel.currentCategoryMovies, currentIndex: $viewModel.currentIndex)
					ScrollerIndicatorView(currentIndex: viewModel.currentIndex)
				}
				.frame(maxWidth: .infinity, alignment: .center)
				VStack(alignment: .leading) {
					Text("Category")
						.padding(.leading, 24)
						.customFont(name: .plusJacartaSemiBold, size: 16)
					ScrollView(.horizontal, showsIndicators: false) {
						HStack {
							ForEach(viewModel.categories, id: \.self) { category in
								FilterCategoriesButton(categryIsChosen: viewModel.checkCategoryName(category: category), categoryName: category, action: viewModel.chooseCategory)
							}
						}
						.padding(.leading,24)
					}
					ScrollView {
						HStack {
							Text("Box Office")
								.customFont(name: .plusJacartaSemiBold, size: 16)
							Spacer()
							Button("See All") {

							}
							.foregroundStyle(.buttonPurple)
						}
						.padding(.horizontal, 24)
						ForEach(viewModel.currentCategoryMovies) { movie in
							MainViewFilmCardView(isFavourite: Binding(
								get: { viewModel.isFavorite(movie: movie) },
								set: { _ in viewModel.toggleFavorite(movie: movie) }
							), movie: movie)
						}
						.padding(.horizontal, 24)
					}
					.scrollIndicators(.hidden)
				}
			}

		}
    }
}

#Preview {
    MainView()
}
