//
//  FilterUniversalButton.swift
//  Moviemax
//
//  Created by Marat Fakhrizhanov on 01.04.2025.
//

import SwiftUI

struct FilterUniversalButton: View {
    @Binding var value: Bool
    let type: String
    let title: String
    let starCount: Int
    
    var body: some View {
        Button {
            value.toggle()
        } label: {
            
            if type == "star" {
                //star
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
                        .foregroundStyle(value ? .buttonPurple : .gray)
                }
            } else {
                //Category
                Text(title)
                    .font(.system(size: 12))
                    .foregroundStyle(.white)
                    .padding(.horizontal,20)
                    .padding(.vertical, 12)
                    .background {
                        RoundedRectangle(cornerRadius: 24)
                            .foregroundStyle(value ? .buttonPurple : .white)
                    }
            }
            
        }
    }
}

#Preview {
    FilterUniversalButton(value: .constant(true), type: "star", title: "All", starCount: 4)
}
