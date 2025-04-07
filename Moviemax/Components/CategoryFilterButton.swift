//
//  CategoryButton.swift
//  Moviemax
//
//  Created by Marat Fakhrizhanov on 01.04.2025.
//

import SwiftUI

struct CategoryFilterButton: View {
    let title: String
    let value: Bool
    let action: (String) -> Void
    
    var body: some View {
        Button {
            action(title)
        } label: {
            if value {
                Text(title)
                    .customFont(name: .plusJacartaRegular, size: 12)
                    .foregroundStyle(.filterCategoriesText)
                    .padding(.horizontal,20)
                    .padding(.vertical, 12)
                    .background {
                        RoundedRectangle(cornerRadius: 24)
                            .foregroundStyle(value ? .buttonPurple : .white)
                    }
            } else {
                Text(title)
                    .foregroundStyle(.filterCategoriesText)
                    .customFont(name: .plusJacartaRegular, size: 12)
                    .padding(.horizontal,20)
                    .padding(.vertical, 12)
                    .overlay {
                        RoundedRectangle(cornerRadius: 24).stroke(style: StrokeStyle(lineWidth: 1))
                            .foregroundStyle(.liteGray)
                            .frame(height: 34)
                    }
            }
        }
        .buttonStyle(.plain)
        .padding(.trailing, 5)
    }
}

#Preview {
    CategoryFilterButton(title: "All", value: false, action: { _ in })
}
