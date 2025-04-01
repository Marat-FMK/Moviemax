//
//  FilterView.swift
//  Moviemax
//
//  Created by Marat Fakhrizhanov on 01.04.2025.
//

import SwiftUI

struct FilterView: View {
    @StateObject var viewModel = SearchViewModel()
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
                        .font(.system(size: 14))
                }
            }
            
            Text("Categories")
                .font(.system(size: 16))
                .bold()
            
            //CATEGORIES
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
            
            HStack{
                
            }

            HStack{
                
            }
            
            PurpleButton(title: "Apply Filters", action: viewModel.applyFilters)
            
        }
        .navigationBarBackButtonHidden(true)
        .padding(.horizontal, 30)
    }
}

#Preview {
    FilterView()
}
