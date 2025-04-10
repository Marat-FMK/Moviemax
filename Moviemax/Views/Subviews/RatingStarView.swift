//
//  RatingStarView.swift
//  Moviemax
//
//  Created by Julia Martcenko on 04/04/2025.
//

import SwiftUI

struct RatingStarView: View {
	var rating: Int

	var lable: String = ""
	var maxRating: Int = 5

	var offImage: Image?
	var onImage = Image(systemName: "star.fill")

	var offColor: Color = .ratingStarGray
	var onColor: Color = .ratingStarYellow

	var body: some View {
		HStack {
			if lable.isEmpty == false {
				Text(lable)
			}
			
			ForEach(1..<maxRating + 1, id: \.self) { number in
				
				image(for: number)
					.foregroundStyle(number > rating ? offColor : onColor)
			}
		}
		.buttonStyle(.plain)
	}
	
	func image(for number: Int) -> Image {
		if number > rating {
			offImage ?? onImage
		} else {
			onImage
		}
	}
}

#Preview {
	RatingStarView(rating: 4)
}
