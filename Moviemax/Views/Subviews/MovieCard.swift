//
//  MovieCard.swift
//  Moviemax
//
//  Created by Marat Fakhrizhanov on 01.04.2025.
//

import SwiftUI

struct MovieCard: View {
    let movieCategory: String
    let movie: Movie
    @Binding var favorite: Bool
    
    let changeFavorite: (UUID) -> Void
    
    var body: some View {
        HStack(alignment:.top, spacing: 12) {
            
            NavigationLink {
                DetailView(id: movie.id ?? 0)
            } label: {
                AsyncImage(url: URL(string: movie.poster?.url ?? "")) { Image in
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
                Text(movie.name ?? "no name")
                    .customFont(name: .plusJacartaBold, size: 18)
                    .foregroundStyle(.filterCategoriesText)
                    .bold()
                
                //TIME
				MovieTimeView(time: movie.movieLenght ?? 000)

                //DATE
				MovieDateVIew(date: String(movie.year ?? 0))

                //TRAILER BUTTON
                MovieCardPlayButton(category: movieCategory == "All" ? movie.genres?[0].name ?? "all" : movieCategory, action: {} ) // action - play trailer action
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

//#Preview {
//	MovieCard(movie: Movie(title: "Luck", date: "2004", image: "luck", urlTrailer: "", rating: 4.4, timing: 148, responders: 54, category: "Adventure", description: """
// Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book 
// """, castCrew: [
//	CrewMemberModel(image: "Director", name: "Jon Watts", role: "Director"),
//	CrewMemberModel(image: "Director", name: "Jon Watts", role: "Director"),
//	CrewMemberModel(image: "Director", name: "Jon Watts", role: "Director")
// ]), favorite: .constant(true), changeFavorite: {_ in })
//}
