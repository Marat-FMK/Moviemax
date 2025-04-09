//
//  FilterCategoriesView.swift
//  Moviemax
//
//  Created by Julia Martcenko on 08/04/2025.
//

import SwiftUI

struct FilterCategoriesView: View {
	@Binding var selectedCategories: [String]
	var checkCategoryName: (String) -> Bool
	var chooseCategory: (String) -> Void

    var body: some View {
		ScrollView(.horizontal, showsIndicators: false) {
			HStack {
				ForEach(selectedCategories, id: \.self) { category in
					FilterCategoriesButton(categryIsChosen: checkCategoryName(category), categoryName: category, action: chooseCategory)
				}
			}
		}
    }
}

#Preview {
	FilterCategoriesView(selectedCategories: .constant(["All", "Action", "Comedy"]), checkCategoryName: { _ in return true}, chooseCategory: { _ in })
}
