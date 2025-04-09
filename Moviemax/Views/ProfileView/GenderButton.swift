//
//  GenderButton.swift
//  Moviemax
//
//  Created by Marat Fakhrizhanov on 09.04.2025.
//

import SwiftUI

struct GenderButton: View {
    @Binding var tempGender: Gender?
    let userGender: Gender?
    let genderName: Gender
    let action: (Gender) -> Void
    
    var body: some View {
            Button {
                tempGender = genderName
            } label: {
                HStack {
                    if userGender != genderName {
                        Circle()
                            .stroke(lineWidth: 1)
                            .frame(width: 24, height: 24)
                            .foregroundStyle(.onboardingBackground)
                    } else {
                        ZStack {
                            Circle()
                                .frame(width: 24, height: 24)
                                .foregroundStyle(.onboardingBackground)
                            Image(systemName: "checkmark")
                                .resizable()
                                .scaledToFit()
                                .foregroundStyle(.white)
                                .frame(height: 10)
                        }
                    }
                    
                    Text(genderName.rawValue)
                        .foregroundStyle(.black)
                        .padding(.leading, 20)
                    
                    Spacer()
                    
                }
                .frame(width: 130)
                .padding(.horizontal, 15)
                .overlay {
                    Capsule()
                        .stroke(lineWidth: 1)
                        .frame(height: 48)
                        .foregroundStyle(.onboardingBackground)
                }
            }
            .buttonStyle(.plain)
            
            
            
      
    }
}

#Preview {
    GenderButton(tempGender: .constant(Gender.male), userGender: nil, genderName: Gender.famale, action: {_ in})
}
