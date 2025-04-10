//
//  MovieCardPlayButton.swift
//  Moviemax
//
//  Created by Marat Fakhrizhanov on 01.04.2025.
//

import SwiftUI

struct MovieCardPlayButton: View {
    let category: String
    let action: () -> Void
    
    var body: some View {
        HStack(spacing: 5) {
            Image(systemName: "film.fill")
                .resizable()
                .scaledToFit()
                .frame(height: 16)
                .foregroundStyle(.infoIcon)
            Button{
                action() // play trailer in youTube
            } label: {
                ZStack{
                    RoundedRectangle(cornerRadius: 6)
                        .frame( width: 65,height: 24)
                        .foregroundStyle(.buttonPurple)
                    Text(category)
                        .customFont(name: .montserrat, size: 10)
                        .foregroundStyle(.white)
                }
            }
            .buttonStyle(.plain)
        }
    }
}

#Preview {
    MovieCardPlayButton(category: "Adventure", action: {})
}
