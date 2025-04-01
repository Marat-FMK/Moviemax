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
                
                ZStack {
                    RoundedRectangle(cornerRadius: 12).stroke(style: StrokeStyle(lineWidth: 2))
                        .frame(height: 32)
                    HStack {
                        ForEach(0 ..< starCount, id: \.self) { count in
                            
                            Image(systemName: "star.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 16)
                        }
                    }
                }
                
            } else {
                //Category
                
            }
            
        }
    }
}

#Preview {
    FilterUniversalButton(value: .constant(true), type: "star", title: "All", starCount: 4)
}
