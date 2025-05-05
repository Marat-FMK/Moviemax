//
//  MovieCard.swift
//  Moviemax
//
//  Created by Marat Fakhrizhanov on 01.04.2025.
//

import SwiftUI

struct MovieCard: View {
    let movie: Movie
    @Binding var favorite: Bool
    
    let changeFavorite: (UUID) -> Void
    
    var body: some View {
        HStack(alignment:.top, spacing: 12) {
            
            NavigationLink {
                DetailView(movie: movie)
            } label: {
                AsyncImage(url: URL(string: movie.image)) { Image in
                    Image
                        .resizable()
                        .frame(width: 120, height: 160)
                        .clipShape(
                            RoundedRectangle.init(cornerRadius: 16)
                        )
                } placeholder: {
                    Image("luck") // Shimmer
                        .resizable()
                        .frame(width: 120, height: 160)
                        .clipShape(
                            RoundedRectangle.init(cornerRadius: 16)
                        )
                }
            }
            
            VStack(alignment: .leading, spacing: 15) {
                Text(movie.title)
                    .customFont(name: .plusJacartaBold, size: 18)
                    .foregroundStyle(.filterCategoriesText)
                    .bold()
                
                //TIME
				MovieTimeView(time: movie.timing)

                //DATE
				MovieDateVIew(date: movie.date)

                //TRAILER BUTTON
                MovieCardPlayButton(category: movie.category, action: {} ) // action - play trailer action
            }
            
            Spacer()
            
            Button{
//                changeFavorite(movie.id)
				favorite.toggle()
            } label: {
                Image(systemName: favorite ? "heart.fill" : "heart")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 20)
                    .foregroundStyle(favorite ? .buttonPurple : .heartNoFill)
            }
        }
        .padding(.vertical, 10)
    }
}

#Preview {
	MovieCard(movie: Movie(title: "Luck", date: .now, image: "luck", urlTrailer: "", rating: 4.4, timing: 148, responders: 54, category: "Adventure", description: """
 Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book 
 """, castCrew: [
	CrewMemberModel(image: "Director", name: "Jon Watts", role: "Director"),
	CrewMemberModel(image: "Director", name: "Jon Watts", role: "Director"),
	CrewMemberModel(image: "Director", name: "Jon Watts", role: "Director")
 ]), favorite: .constant(true), changeFavorite: {_ in })
}
