//
//  CategoryButtonsScroll.swift
//  Moviemax
//
//  Created by Marat Fakhrizhanov on 08.04.2025.
//

import SwiftUI

struct CategoryButtonsScroll: View {
    let categories: [String]
    let valueCheckAction: (String) -> Bool
    let chooseCategoryAction: (String) -> Void
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(categories, id: \.self) { category in
                    CategoryFilterButton(title: category, value: valueCheckAction(category), action: chooseCategoryAction)
                }
            }
            .padding(.leading,24)
        }
        
    }
}

//#Preview {
//    CategoryButtonsScroll(categories: ["All", "Adventure"], valueCheckAction: { _ in }, chooseCategoryAction: {_ in})
//}
