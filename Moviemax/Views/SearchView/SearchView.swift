//
//  SearchView.swift
//  Moviemax
//
//  Created by Marat Fakhrizhanov on 01.04.2025.
//

import SwiftUI

struct SearchView: View {
    @StateObject var viewModel = SearchViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Search")
                    .customFont(name: .plusJacartaSemiBold, size: 18)
                    .padding(.bottom, 30)
                
                VStack(spacing: 20) {
                    SearchField(viewModel: viewModel, searchText: $viewModel.searchText, presentFilter: $viewModel.presentFilter, action: viewModel.searchFilms)
                        .padding(.horizontal, 24)
                    
                    //CATEGORIES
                 //  CategoryButtonsScroll(categories: viewModel.selectedCategories, valueCheckAction: viewModel.checkCategoryName, chooseCategoryAction: viewModel.chooseCategory)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(viewModel.selectedCategories, id: \.self) { category in
                                CategoryFilterButton(title: category, value: viewModel.checkCategoryName(category: category), action: viewModel.chooseCategory)
                            }
                        }
                        .padding(.leading,24)
                    }
                    
                    //MOVIECARDS
                    ScrollView(showsIndicators: false) {
                        ForEach(viewModel.currentCategoryMovies, id: \.title ) { movie in
                            MovieCard(movie: movie, changeFavorite: viewModel.changeFavorite)
                        }
                        .padding(.bottom, 80)
                    }
                    .padding(.horizontal, 24)
                    
                }
                
            }
            .blur(radius: viewModel.presentFilter ? 4 : 0)
            .sheet(isPresented: $viewModel.presentFilter) {
                FilterView(viewModel: viewModel)
                    .presentationDetents([.medium])
            }
        }
    }
}

#Preview {
    SearchView()
}
