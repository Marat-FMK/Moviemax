//
//  MovieTime.swift
//  Moviemax
//
//  Created by Marat Fakhrizhanov on 01.04.2025.
//

import SwiftUI

struct MovieTime: View {
    let time: String
    var body: some View {
        HStack(spacing: 5) {
                            Image(systemName: "clock.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 16)
                                .foregroundStyle(.infoIcon)
                            Text(time)
                                .font(.system(size: 12))
                                .foregroundStyle(.gray)
                            Text("Minutes")
                                .font(.system(size: 12))
                                .foregroundStyle(.gray)
                        }
    }
}

#Preview {
    MovieTime(time: "128")
}
