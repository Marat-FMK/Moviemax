//
//  CustomSecretPasswordTFView.swift
//  Moviemax
//
//  Created by Marat Fakhrizhanov on 31.03.2025.
//

import SwiftUI

struct CustomSecretPasswordTFView: View {
    @Binding var visible: Bool
    @Binding var answer: String
    let title: String
    var body: some View {
        
        VStack( alignment: .leading) {
            Text(title)
                .foregroundStyle(.gray)
                .font(.system(size: 14))
            
            ZStack {
                RoundedRectangle(cornerRadius: 24)
                    .frame(height: 56)
                    .foregroundStyle(.tf)
                if visible {
                    HStack {
                        TextField("Enter your password", text: $answer)
                        
                        Button{
                            visible.toggle()
                        } label: {
                            Image(systemName: "eye.slash.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 24)
                                .foregroundStyle(.gray)
                        }
                        .buttonStyle(.plain)
                    }
                    .padding(.horizontal, 15)
                } else {
                    HStack{
                        SecureField("Enter your password", text: $answer)
                        
                        Button{
                            visible.toggle()
                        } label: {
                            Image(systemName: "eye.slash.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 24)
                                .foregroundStyle(.gray)
                        }
                        .buttonStyle(.plain)
                    }
                    .padding(.horizontal, 15)
                }
            }
        }
    }
}

#Preview {
    CustomSecretPasswordTFView(visible: .constant(false), answer: .constant("12345"), title: "Password")
}
