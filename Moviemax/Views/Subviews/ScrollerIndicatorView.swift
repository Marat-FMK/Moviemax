//
//  ScrollerIndicatorView.swift
//  Moviemax
//
//  Created by Julia Martcenko on 03/04/2025.
//

import SwiftUI

struct ScrollerIndicatorView: View {
	let currentIndex: Int

    var body: some View {
		HStack(spacing: 8) {
			ForEach(0..<3, id: \.self) { index in
				RoundedRectangle(cornerRadius: 5)
					.fill(index == currentIndex ? Color.onboardingBackground : Color.scrollIndicatorStandart)
					.frame(width: index == currentIndex ? 24 : 8, height: 8)
					.animation(.spring(), value: currentIndex)
			}
		}
    }
}

#Preview {
	ScrollerIndicatorView(currentIndex: 1)
}
