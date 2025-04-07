//
//  BackButtonView.swift
//  Moviemax
//
//  Created by Julia Martcenko on 04/04/2025.
//

import SwiftUI

struct BackButtonView: View {
	let action: () -> Void

    var body: some View {
		Button {
			action()
		} label: {
			ZStack{
				Circle()
					.frame(width: 48, height: 48)
					.foregroundStyle(.backButtonBG)

				Image(systemName: "arrow.left")
					.resizable()
					.scaledToFit()
					.frame(height: 14)
			}
		}
		.buttonStyle(.plain)
    }
}

#Preview {
	BackButtonView(action: {})
}
