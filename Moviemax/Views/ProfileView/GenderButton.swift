//
//  GenderButton.swift
//  Moviemax
//
//  Created by Marat Fakhrizhanov on 09.04.2025.
//

import SwiftUI

struct GenderButton: View {
    @Binding var gender: String
    let genderName: Gender
    
    var body: some View {
            Button {
                gender = genderName.rawValue
            } label: {
                HStack {
                    if gender != genderName.rawValue{
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
                                .foregroundStyle(.tf)
                                .frame(height: 10)
                        }
                    }
                    
                    Text(genderName.rawValue)
                        .foregroundStyle(.filterCategoriesText)
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

//#Preview {
//    GenderButton(trigger: .constant(false), tempGender: .constant(Gender.male), userGender: nil, genderName: Gender.famale, action: {_ in})
//}
