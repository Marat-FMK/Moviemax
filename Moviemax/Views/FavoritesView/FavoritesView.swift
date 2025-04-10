//
//  FavoritesView.swift
//  Moviemax
//
//  Created by Marat Fakhrizhanov on 08.04.2025.
//

import SwiftUI

struct FavoritesView: View {
    @StateObject var viewModel = FavoritesViewModel()
    
    var body: some View {
        NavigationView {
            VStack{
                ScrollView(showsIndicators: false) {
                    ForEach(viewModel.favoriteMovies, id: \.title ) { movie in
                        MovieCard(movie: movie, changeFavorite: viewModel.changeFavorite)
                    }
                    .padding(.bottom, 80)
                }
                .padding(.horizontal, 24)
            }
            .navigationTitle("Favorites")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    FavoritesView()
}
