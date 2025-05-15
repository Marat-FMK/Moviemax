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
            
            AsyncImage(url: URL(string: movie.poster?.url ?? "")) { Image in
                Image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80, height: 80)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .clipped()
            } placeholder: {
                ShimmerView(width: 80, height: 80, color: .buttonPurple)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .clipped()
            }
            
			VStack(alignment: .leading) {
				HStack {
                    Text(movie.genres?[0].name ?? "all")
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
				Text(movie.name ?? "no name")
					.customFont(name: .plusJacartaBold, size: 18)
					.foregroundStyle(.textBlack)
					.padding(.bottom, 8)
				HStack {
					MovieTimeView(time: movie.movieLength ?? 0) 
					Spacer()
                    MainFilmCardRatingView(rating: movie.rating?.imdb ?? 0.0, responders: 0) // ????
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




//#Preview {
//	MainViewFilmCardView(isFavourite: .constant(true), movie: Movie(title: "Luck", date: "2005", image: "luck", urlTrailer: "", rating: 4.4, timing: 148, responders: 54, category: "Adventure", description: """
// Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book 
// """, castCrew: [
//	CrewMemberModel(image: "Director", name: "Jon Watts", role: "Director"),
//	CrewMemberModel(image: "Director", name: "Jon Watts", role: "Director"),
//	CrewMemberModel(image: "Director", name: "Jon Watts", role: "Director")
// ]))
//}
