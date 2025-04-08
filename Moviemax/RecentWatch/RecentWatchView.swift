//
//  RecentWatch.swift
//  Moviemax
//
//  Created by Marat Fakhrizhanov on 08.04.2025.
//

import SwiftUI

struct RecentWatchView: View {
    
    @StateObject var viewModel = RecentWatchViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
//                CategoryButtonsScroll(categories: viewModel.categories, valueCheckAction: viewModel.checkChooseCategory, chooseCategoryAction: viewModel.chooseCategory)
//                    .padding(.vertical, 10)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(viewModel.categories, id: \.self) { category in
                            CategoryFilterButton(title: category,
                                                 value: viewModel.checkChooseCategory(category: category),
                                                 action: viewModel.chooseCategory)
                        }
                    }
                    .padding(.leading, 24)
                }
                .padding(.vertical, 10)
                
                ScrollView( showsIndicators: false) {
                    VStack( spacing: 10) {
                        ForEach(viewModel.chooseCategoryMovies, id: \.id) { movie in
                            MovieCard(movie: movie, changeFavorite: viewModel.changeFavorite)
                        }
                    }
                }
                .padding(.horizontal, 24)
            }
            .navigationTitle("RecentWatch")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    RecentWatchView()
}
