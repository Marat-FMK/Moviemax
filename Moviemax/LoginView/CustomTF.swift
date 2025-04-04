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
    
    var body: some View {
        VStack( alignment: .leading) {
            Text(title)
                .foregroundStyle(.loginTitle)
                .font(.system(size: 14))
            
            ZStack {
                RoundedRectangle(cornerRadius: 24)
                    .frame(height: 56)
                    .foregroundStyle(.tf)
                TextField(tfBGtext, text: $answer)
                    .padding(.horizontal, 15)
            }
            
        }
    }
}

#Preview {
    CustomTF(answer: .constant(""), title: "Email", tfBGtext: "Enter your email")
}
