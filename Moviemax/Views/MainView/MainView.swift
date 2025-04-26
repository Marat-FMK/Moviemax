//
//  MainView.swift
//  Moviemax
//
//  Created by Julia Martcenko on 07/04/2025.
//

import SwiftUI

struct MainView: View {
	@StateObject var viewModel: MainViewModel = .init()
    @State private var selectedMovie: Movie? = nil

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
				VStack(alignment: .center) {
					CarouselView(images: viewModel.currentCategoryMovies, currentIndex: $viewModel.currentIndex)
					ScrollerIndicatorView(currentIndex: viewModel.currentIndex)
				}
				.frame(maxWidth: .infinity, alignment: .center)
				VStack(alignment: .leading) {
					Text("Category")
						.customFont(name: .plusJacartaSemiBold, size: 16)
					ScrollView(.horizontal, showsIndicators: false) {
						HStack {
							ForEach(viewModel.categories, id: \.self) { category in
								FilterCategoriesButton(categryIsChosen: viewModel.checkCategoryName(category: category), categoryName: category, action: viewModel.chooseCategory)
							}
						}
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
                        ForEach(viewModel.currentCategoryMovies) { movie in
							NavigationLink(destination: DetailView(movie: movie)) {
                                MainViewFilmCardView(isFavourite: Binding(
                                    get: { viewModel.isFavorite(movie: movie) },
                                    set: { _ in viewModel.toggleFavorite(movie: movie) }
                                ), movie: movie)
                            }
                        }
					}
					.scrollIndicators(.hidden)
				}
			}
            .padding(.horizontal, 24)
		}
        .onAppear {
            viewModel.loudUserName()
        }
        .sheet(item: $selectedMovie) { movie in
			DetailView(movie: movie)
        }
    }
}

#Preview {
    MainView()
}
