//
//  AvatarButtons.swift
//  Moviemax
//
//  Created by Marat Fakhrizhanov on 12.04.2025.
//

import SwiftUI

struct AvatarButton: View {
    let imageName: String
    let text: String
    let destructive: Bool
    
    var body: some View {
        HStack {
            Image(systemName: imageName)
                .resizable()
                .scaledToFit()
                .frame(height: 20)
                .foregroundStyle(destructive ? .red : .black)
            Text(text)
                .foregroundStyle(destructive ? .red : .black)
                .customFont(name: .plusJacartaRegular, size: 14)
            Spacer()
        }
        .padding(.leading, 15)
        .frame(width: 296, height: 60)
        .background {
            RoundedRectangle(cornerRadius: 10)
                .foregroundStyle(.liteGray)
        }
    }
}

#Preview {
    AvatarButton(imageName: "camera.fill", text: "Take a photo", destructive: true)
}
