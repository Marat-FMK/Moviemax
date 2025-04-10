//
//  MovieTime.swift
//  Moviemax
//
//  Created by Marat Fakhrizhanov on 01.04.2025.
//

import SwiftUI

struct MovieTime: View {
	let time: Int
    var body: some View {
        HStack(spacing: 5) {
            Image(systemName: "clock.fill")
                .resizable()
                .scaledToFit()
                .frame(height: 16)
                .foregroundStyle(.infoIcon)
            Text("\(time) Minutes")
                .customFont(name: .montserrat, size: 12)
                .foregroundStyle(.filmInfoGray)
        }
    }
}

#Preview {
    MovieTime(time: 128)
}
