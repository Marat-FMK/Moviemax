//
//  MovieDate.swift
//  Moviemax
//
//  Created by Marat Fakhrizhanov on 01.04.2025.
//

import SwiftUI

struct MovieDate: View {
    let date: String
    
    var body: some View {
        HStack(spacing: 5) {
            Image(systemName: "calendar")
                .resizable()
                .scaledToFit()
                .frame(height: 16)
                .foregroundStyle(.infoIcon)
            Text(date)
                .font(.system(size: 12))
                .foregroundStyle(.filmInfoGray)
        }
    }
}

#Preview {
    MovieDate(date: "12 Nov 2019")
}
