//
//  FilterCategoriesButton.swift
//  Moviemax
//
//  Created by Julia Martcenko on 07/04/2025.
//

import SwiftUI

struct FilterCategoriesButton: View {
	var categryIsChosen: Bool
	let categoryName: String
	var action: (String) -> Void

    var body: some View {
		if categryIsChosen {
			Button{
				action(categoryName)
			} label: {
				ZStack{
					RoundedRectangle(cornerRadius: 24)
						.foregroundStyle(.buttonPurple)
						.frame(height: 34)
					Text(categoryName)
						.customFont(name: .plusJacartaRegular, size: 12)
						.foregroundStyle(.white)
						.padding(.horizontal,24)
				}
				.padding(1)
			}
			.buttonStyle(.plain)
		} else {
			Button{
				action(categoryName)
			} label: {
				ZStack {
					RoundedRectangle(cornerRadius: 24).stroke(style: StrokeStyle(lineWidth: 1))
						.foregroundStyle(.liteGray)
						.frame(height: 34)
					Text(categoryName)
						.foregroundStyle(.categoryTitle)
						.padding(.horizontal,24)
				}
				.padding(1)
			}
			.buttonStyle(.plain)
		}
    }
}

#Preview {
	FilterCategoriesButton(categryIsChosen: true, categoryName: "Action", action: {_ in })
}
