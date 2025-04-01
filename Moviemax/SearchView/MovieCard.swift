//
//  MovieCard.swift
//  Moviemax
//
//  Created by Marat Fakhrizhanov on 01.04.2025.
//

import SwiftUI

struct MovieCard: View {
    let movie: Movie
    let changeFavorite: (UUID) -> Void
    
    var body: some View {
        HStack(alignment:.top, spacing: 12) {
            AsyncImage(url: URL(string: movie.image)) { Image in
                Image
                    .resizable()
                    .frame(width: 120, height: 160)
                    .clipShape(
                        RoundedRectangle.init(cornerRadius: 16)
                    )
            } placeholder: {
                Image("jurassic")
                    .resizable()
                    .frame(width: 120, height: 160)
                    .clipShape(
                        RoundedRectangle.init(cornerRadius: 16)
                    )
            }
            .onTapGesture {
                // go to detail View
                print("go to detail View")
            }
            
            VStack(alignment: .leading, spacing: 15) {
                Text(movie.title)
                    .font(.system(size: 18))
                    .foregroundStyle(.black)
                    .bold()
                //TIME
                HStack(spacing: 5) {
                    Image(systemName: "clock.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 16)
                        .foregroundStyle(.infoIcon)
                    Text(movie.time)
                        .font(.system(size: 12))
                        .foregroundStyle(.gray)
                    Text("Minutes")
                        .font(.system(size: 12))
                        .foregroundStyle(.gray)
                }
                //DATE
                HStack(spacing: 5) {
                    Image(systemName: "calendar")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 16)
                        .foregroundStyle(.infoIcon)
                    Text(movie.date)
                        .font(.system(size: 12))
                        .foregroundStyle(.gray)
                }
                //TRAILER BUTTON
                HStack(spacing: 5) {
                    Image(systemName: "film.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 16)
                        .foregroundStyle(.infoIcon)
                    Button{
                        // play trailer in youTube
                    } label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 6)
                                .frame( width: 65,height: 24)
                                .foregroundStyle(.buttonPurple)
                            Text(movie.category)
                                .font(.system(size: 10))
                                .foregroundStyle(.white)
                        }
                    }
                    .buttonStyle(.plain)
                }
            }
            
            Spacer()
            
            Button{
                changeFavorite(movie.id)
            } label: {
                Image(systemName: movie.favorite ? "heart.fill" : "heart")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 20)
                    .foregroundStyle(movie.favorite ? .buttonPurple : .gray)
            }
        }
        .padding(.vertical, 10)
    }
}

#Preview {
    MovieCard(movie: Movie(title: "Jurassic world", time: "215", date: "9 Sep 2016", image: "", urlTrailer: "", favorite: true, rating: 5, category: "Fantasy", castAndCrew: "no no"), changeFavorite: {_ in })
}
