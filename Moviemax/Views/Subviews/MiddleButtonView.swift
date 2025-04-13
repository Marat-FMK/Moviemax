//
//  MiddleButtonView.swift
//  Moviemax
//
//  Created by Julia Martcenko on 04/04/2025.
//

import SwiftUI

struct MiddleButtonView: View {
	let action: () -> ()
	let label: String

	var body: some View {
		Button(action: action) {
			Text(label)
				.foregroundColor(.white)
				.customFont(name: .plusJacartaSemiBold, size: 16)
				.padding(16)
				.frame(maxWidth: .infinity)
				.background(.accentPurple)
				.cornerRadius(24
				)
		}
	}
}

#Preview {
	MiddleButtonView(action: {}, label: "Button")
}

