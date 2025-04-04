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
                    .font(.system(size: 18))
                    .bold()
                    .padding(.bottom, 30)
                
                VStack(spacing: 20) {
                    SearchField(viewModel: viewModel, searchText: $viewModel.searchText, presentFilter: $viewModel.presentFilter, action: viewModel.searchFilms)
                        .padding(.horizontal, 24)
                    
                    //CATEGORIES
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(viewModel.selectedCategories, id: \.self) { category in
                                
                                if viewModel.checkCategoryName(category: category) {
                                    Button{
                                        viewModel.chooseCategory(category: category)
                                    } label: {
                                        ZStack{
                                            RoundedRectangle(cornerRadius: 24)
                                                .foregroundStyle(.buttonPurple)
                                                .frame(height: 34)
                                            Text(category)
                                                .foregroundStyle(.white)
                                                .padding(.horizontal,24)
                                        }
                                        .padding(1)
                                    }
                                    .buttonStyle(.plain)
                                } else {
                                    Button{
                                        viewModel.chooseCategory(category: category)
                                    } label: {
                                        ZStack {
                                            RoundedRectangle(cornerRadius: 24).stroke(style: StrokeStyle(lineWidth: 1))
                                                .foregroundStyle(.liteGray)
                                                .frame(height: 34)
                                            Text(category)
                                                .foregroundStyle(.categoryTitle)
                                                .padding(.horizontal,24)
                                        }
                                        .padding(1)
                                    }
                                    .buttonStyle(.plain)
                                }
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
        }
    }
}

#Preview {
    SearchView()
}
