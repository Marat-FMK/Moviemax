//
//  LongPurpleButton.swift
//  Moviemax
//
//  Created by Marat Fakhrizhanov on 31.03.2025.
//

import SwiftUI

struct PurpleButton: View {
    let title: String
    let action: () -> Void
    
    var body: some View {
        VStack(spacing: 16) {
            Button {
                action()
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 24)
                        .frame(height: 56)
                        .foregroundStyle(.buttonPurple)
                    
                    Text(title)
                        .customFont(name: .plusJacartaSemiBold, size: 16)
                        .foregroundStyle(.white)
                }
            }
            .buttonStyle(.plain)
        }
    }
}
#Preview {
    PurpleButton(title: "Sign In", action: {} )
}
