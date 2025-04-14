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
					.frame(width: 32, height: 32)
                    .foregroundStyle(.thinMaterial)

				Image(systemName: "arrow.left")
					.resizable()
					.scaledToFit()
					.frame(height: 14)
					.foregroundStyle(.textBlack)
			}
		}
		.buttonStyle(.plain)
    }
}

#Preview {
	BackButtonView(action: {})
}
