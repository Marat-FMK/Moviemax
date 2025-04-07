//
//  ForgotPasswordView.swift
//  Moviemax
//
//  Created by Marat Fakhrizhanov on 30.03.2025.
//

import SwiftUI

struct ForgotPasswordView: View {
    @StateObject var viewModel = LoginViewViewModel()
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 50) {
            
            HStack {
				BackButtonView(action: {
                    viewModel.emailForPasswordChange =  ""
                    dismiss()
                } label: {
                    ZStack{
                        Circle()
                            .frame(width: 48, height: 48)
                            .foregroundStyle(.backButtonBG)
                        
                        Image(systemName: "arrow.left")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 14)
                    }
                }
                .buttonStyle(.plain)
                
                Text("Forgot your password")
                    .customFont(name: .plusJacartaSemiBold, size: 18)
                    .padding(.leading, 35) // ???
            }
            
            CustomTF(answer: $viewModel.emailForPasswordChange, title: "Email", tfBGtext: "Enter your email")
            
            Spacer()
            
            PurpleButton(title: "Submit", action: viewModel.passwordСhange)
                .padding(.bottom, 20)
        }
        .navigationBarBackButtonHidden(true)
        .padding(.horizontal, 24)
    }
}

#Preview {
    ForgotPasswordView()
}
