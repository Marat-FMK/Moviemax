//
//  FilterView.swift
//  Moviemax
//
//  Created by Marat Fakhrizhanov on 01.04.2025.
//

import SwiftUI

struct FilterView: View {
//    @StateObject var viewModel = SearchViewModel()
    @ObservedObject var viewModel: SearchViewModel
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            
            HStack{
                Button{
                    dismiss()
                } label: {
                    Image(systemName: "xmark")
                        .resizable()
                        .scaledToFit()
                        .foregroundStyle(.black)
                        .frame( height: 12)
                }
                Text("Filter")
                    .font(.system(size: 18))
                Spacer()
                Button {
                    viewModel.resetFilters()
                } label: {
                    Text("Reset Filters")
                        .foregroundStyle(.buttonPurple)
                        .font(.system(size: 14))
                }
            }
            
            //CATEGORIES
            Text("Categories")
                .font(.system(size: 16))
                .bold()
            
            HStack{
                CategoryFilterButton(title: "All", value: viewModel.checkFilterCategory(category: "All"), action: viewModel.addOrRemoveSelectedCategory)
                CategoryFilterButton(title: "Action", value: viewModel.checkFilterCategory(category: "Action"), action: viewModel.addOrRemoveSelectedCategory)
                CategoryFilterButton(title: "Adventure", value: viewModel.checkFilterCategory(category: "Adventure"), action: viewModel.addOrRemoveSelectedCategory)
            }
            HStack{
                CategoryFilterButton(title: "Mystery", value: viewModel.checkFilterCategory(category: "Mystery"), action: viewModel.addOrRemoveSelectedCategory)
                CategoryFilterButton(title: "Fantasy", value: viewModel.checkFilterCategory(category: "Fantasy"), action: viewModel.addOrRemoveSelectedCategory)
                CategoryFilterButton(title: "Others", value: viewModel.checkFilterCategory(category: "Others"), action: viewModel.addOrRemoveSelectedCategory)
            }
            
            //STAR RATING
            Text("Star Rating")
                .font(.system(size: 16))
                .bold()
            
            HStack{
                StarRetingButton(starCount: 1, value: viewModel.checkRatint(rating: 1), action: viewModel.addOrRemoveSelectedRating)
                StarRetingButton(starCount: 2, value: viewModel.checkRatint(rating: 1), action: viewModel.addOrRemoveSelectedRating)
                StarRetingButton(starCount: 3, value: viewModel.checkRatint(rating: 1), action: viewModel.addOrRemoveSelectedRating)
            }

            HStack{
                StarRetingButton(starCount: 4, value: viewModel.checkRatint(rating: 1), action: viewModel.addOrRemoveSelectedRating)
                StarRetingButton(starCount: 5, value: viewModel.checkRatint(rating: 1), action: viewModel.addOrRemoveSelectedRating)
            }
            
            PurpleButton(title: "Apply Filters", action: viewModel.applyFilters)
                .onSubmit {
                    dismiss()
                }
            
        }
        .onAppear {
            viewModel.setTemporaryCategories()
        }
        .navigationBarBackButtonHidden(true)
        .padding(.horizontal, 30)
    }
}

#Preview {
    FilterView(viewModel: SearchViewModel())
}
