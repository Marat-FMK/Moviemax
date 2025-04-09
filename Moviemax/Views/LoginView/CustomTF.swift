//
//  CustomTF.swift
//  Moviemax
//
//  Created by Marat Fakhrizhanov on 30.03.2025.
//

import SwiftUI

struct CustomTF: View {
    @Binding var answer: String
    let title: String
    let tfBGtext: String
    
    let isProfileView: Bool
    
    
    var body: some View {
        VStack( alignment: .leading) {
            Text(title)
                .foregroundStyle(.loginTitle)
                .customFont(name: .plusJacartaSemiBold, size: 14)
//                .minimumScaleFactor(0.5)
            
            ZStack {
                RoundedRectangle(cornerRadius: 24)
                    .frame(height: 56)
                    .foregroundStyle(.tf)
                TextField(tfBGtext, text: $answer)
                    .textInputAutocapitalization(.never)
                    .padding(.horizontal, 15)
            }
            .overlay {
                RoundedRectangle(cornerRadius: 24).stroke(lineWidth: 1)
                    .foregroundStyle( isProfileView ? .onboardingBackground : .tfOverlay)
            }
            
        }
    }
}

#Preview {
    CustomTF(answer: .constant(""), title: "Email", tfBGtext: "Enter your email", isProfileView: true)
}
