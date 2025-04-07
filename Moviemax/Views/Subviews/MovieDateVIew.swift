//
//  MovieDateVIew.swift
//  Moviemax
//
//  Created by Julia Martcenko on 04/04/2025.
//

import SwiftUI

struct MovieDateVIew: View {
	let date: Date
    var body: some View {
		HStack(spacing: 5) {
			Image(systemName: "calendar")
				.resizable()
				.scaledToFit()
				.frame(height: 16)
				.foregroundStyle(.infoIcon)
			Text(date, format: Date.FormatStyle(date: .abbreviated, time: .omitted))
				.font(.system(size: 12))
				.foregroundStyle(.subtextGray)
		}
    }
}

#Preview {
	MovieDateVIew(date: .now)
}
