//
//  MiddleButtonView.swift
//  Moviemax
//
//  Created by Julia Martcenko on 03/04/2025.
//

import SwiftUI

struct MiddleButtonView: View {
	let action: () -> ()
	let label: String

	var body: some View {
		Button(action: action) {
			Text(label)
				.foregroundColor(.white)
				.font(.callout)
				.fontWeight(.semibold)
				.padding(16)
				.frame(maxWidth: .infinity)
				.background(.onboardingBackground)
				.cornerRadius(24
				)
		}
	}
}

#Preview {
	MiddleButtonView(action: {}, label: "Button")
}
