//
//  MovieCategoryView.swift
//  Moviemax
//
//  Created by Julia Martcenko on 04/04/2025.
//

import SwiftUI

struct MovieCategoryView: View {
	let category: String

    var body: some View {
		HStack(spacing: 5) {
			Image(systemName: "film.fill")
				.resizable()
				.scaledToFit()
				.frame(height: 16)
				.foregroundStyle(.infoIcon)
			Text(category)
				.font(.system(size: 12))
				.foregroundStyle(.gray)
		}
    }
}

#Preview {
	MovieCategoryView(category: "Action")
}
