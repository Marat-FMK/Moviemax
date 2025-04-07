//
//  MovieTimeView.swift
//  Moviemax
//
//  Created by Julia Martcenko on 04/04/2025.
//

import SwiftUI

struct MovieTimeView: View {
	let time: Int

    var body: some View {
		HStack(spacing: 5) {
			Image(systemName: "clock.fill")
				.resizable()
				.scaledToFit()
				.frame(height: 16)
				.foregroundStyle(.infoIcon)
			Text(String.localizedStringWithFormat("%d Minute%@", time, time == 1 ? "" : "s"))
				.font(.system(size: 12))
				.foregroundStyle(.subtextGray)
		}
    }
}

#Preview {
	MovieTimeView(time: 148)
}
