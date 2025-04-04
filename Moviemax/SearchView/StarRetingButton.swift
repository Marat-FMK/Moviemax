//
//  StarRetingView.swift
//  Moviemax
//
//  Created by Marat Fakhrizhanov on 04.04.2025.
//

import SwiftUI

struct StarRatingButton: View {
    let starCount: Int
    let value: Bool
    let action: (Int)-> Void
    
    var body: some View {
        Button {
            action(starCount)
        } label: {
            HStack{
                ForEach(0 ..< starCount, id: \.self) { count in
                    Image(systemName: "star.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 16)
                        .foregroundStyle( .yellow)
                }
            }
            .padding(.horizontal, 20)
            .overlay {
                RoundedRectangle(cornerRadius: 24).stroke(style: StrokeStyle(lineWidth: 2))
                    .frame(height: 32)
                    .foregroundStyle(value ? .buttonPurple : .liteGray)
            }
        }
        .buttonStyle(.plain)
        .padding(.trailing, 10)
        .padding(.bottom, 13)
    }
}

#Preview {
    StarRatingButton(starCount: 4, value: true, action: { _ in })
}
