//
//  MainViewFilmCardView.swift
//  Moviemax
//
//  Created by Julia Martcenko on 08/04/2025.
//

import SwiftUI

struct MainViewFilmCardView: View {
	@Binding var isFavourite: Bool

	let movie: Movie

    var body: some View {
		HStack(spacing: 12) {
			Image(movie.image)
				.resizable()
				.scaledToFill()
				.frame(width: 80, height: 80)
				.clipShape(RoundedRectangle(cornerRadius: 8))
				.clipped()
			VStack(alignment: .leading) {
				HStack {
					Text(movie.category)
						.customFont(name: .plusJacartaRegular, size: 12)
						.foregroundStyle(.subtextGray)
					Spacer()
					Button {
						isFavourite.toggle()
					} label: {
						Image(systemName: isFavourite ? "heart.fill" : "heart")
							.resizable()
							.scaledToFit()
							.frame(height: 17)
							.foregroundStyle(isFavourite ? .buttonPurple : .heartNoFill)
					}
				}
				Text(movie.title)
					.customFont(name: .plusJacartaBold, size: 18)
					.foregroundStyle(.textBlack)
					.padding(.bottom, 8)
				HStack {
					MovieTime(time: movie.time)
					Spacer()
					MainFilmCardRatingView(rating: movie.rating, responders: movie.responders)
				}
			}
		}
    }
}

struct MainFilmCardRatingView: View {
	let rating: Double
	let responders: Int

	var body: some View {
		HStack(spacing: 0) {
			Image(systemName: "star.fill")
				.resizable()
				.scaledToFit()
				.frame(height: 16)
				.foregroundStyle( .yellow)
			Text(String(format: "%.1f", rating))
				.customFont(name: .plusJacartaSemiBold, size: 12)
				.foregroundStyle(.yellow)
			Text("(\(responders))")
				.customFont(name: .plusJacartaSemiBold, size: 12)
				.foregroundStyle(.subtextGray)
		}
	}
}

#Preview {
	MainViewFilmCardView(isFavourite: .constant(true), movie: Movie(title: "Luck", time: 148, date: "12.11.25", image: "luck", urlTrailer: "", favorite: true, rating: 4.4, category: "Adventure", castAndCrew: "", responders: 54))
}
