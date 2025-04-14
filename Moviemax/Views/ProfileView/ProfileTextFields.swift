//
//  ProfileTextFields.swift
//  Moviemax
//
//  Created by Marat Fakhrizhanov on 09.04.2025.
//

import SwiftUI

struct ProfileTextFields: View {
    @Binding var trigger: Bool
    @Binding var answer: String
    let title: String
    let tfBGtext: String

    
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
                    .foregroundStyle(.onboardingBackground)
            }
            
        }
    }
}

#Preview {
    ProfileTextFields(trigger: .constant(false), answer: .constant("Test"), title: "Test", tfBGtext: "Test")
}
