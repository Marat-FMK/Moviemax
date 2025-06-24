//
//  GoogleButton.swift
//  Moviemax
//
//  Created by Marat Fakhrizhanov on 31.03.2025.
//

import SwiftUI

struct GoogleButton: View {
    let action: ()-> Void
     
    var body: some View {
        Button { 
            action()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 24).stroke(style: StrokeStyle(lineWidth: 2))
                    .frame(height: 56)
                HStack {
                    Image("googleIcon")
                    Text("Continue with Google")
                        .customFont(name: .plusJacartaSemiBold, size: 16)
                }
            }
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    GoogleButton(action: {})
}
