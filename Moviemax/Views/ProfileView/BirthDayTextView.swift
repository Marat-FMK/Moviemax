//
//  DateTFView.swift
//  Moviemax
//
//  Created by Marat Fakhrizhanov on 12.04.2025.
//

import SwiftUI

struct BirthDayTextView: View {
    @Binding var presentCalendar: Bool
    let date: String
    let title: String
    
    var body: some View {
        VStack( alignment: .leading) {
            Text(title)
                .foregroundStyle(.loginTitle)
                .customFont(name: .plusJacartaSemiBold, size: 14)
            
            ZStack {
                RoundedRectangle(cornerRadius: 24)
                    .frame(height: 56)
                    .foregroundStyle(.tf)
                
                HStack {
//                    TextField(tfBGtext, text: $date)
//                        .textInputAutocapitalization(.never)
                    Text(date)
                    
                    Spacer()
                    
                    Button{
                        withAnimation {
                            presentCalendar.toggle()
                        }
                    } label: {
                        Image(systemName: "calendar")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24)
                            .foregroundStyle(.buttonPurple)
                    }
                }
                .padding(.horizontal, 20)
            }
            .overlay {
                RoundedRectangle(cornerRadius: 24).stroke(lineWidth: 1)
                    .foregroundStyle(.onboardingBackground)
            }
            
        }
    }
}

//#Preview {
//    BirthDayTextView(presentCalendar: .constant(false), date: .constant(Date.now), title: "Date of Birth")
//}
