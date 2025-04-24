//
//  ForgotPasswordView.swift
//  Moviemax
//
//  Created by Marat Fakhrizhanov on 30.03.2025.
//

import SwiftUI

struct ForgotPasswordView: View {
    @Environment(\.dismiss) var dismiss
    @Binding var emailForPasswordChange: String
    @State var presentAlert = false
    let action: () -> Void
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 50) {
            
            HStack {
				BackButtonView(action: {
                    dismiss()
                })
                
                Text("Forgot your password")
                    .customFont(name: .plusJacartaSemiBold, size: 18)
                    .padding(.leading, 35) // ???
            }
            
            CustomTF(answer: $emailForPasswordChange, title: "Email", tfBGtext: "Enter your email")
            
            Spacer()
            
//            PurpleButton(title: "Submit", action: action)
//                .padding(.bottom, 20)
            VStack(spacing: 16) {
                Button {
                    action()
                    presentAlert = true
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 24)
                            .frame(height: 56)
                            .foregroundStyle(.buttonPurple)
                        
                        Text("Submit")
                            .customFont(name: .plusJacartaSemiBold, size: 16)
                            .foregroundStyle(.white)
                    }
                }
                .buttonStyle(.plain)
            }
            
        }
        .alert("Check your email", isPresented: $presentAlert, actions: {
            Button{
                emailForPasswordChange =  ""
                dismiss()
            } label: {
                Text("OK")
            }
        }, message: {
            Text("We have sent instructions for changing the password")
        })
        .navigationBarBackButtonHidden(true)
        .padding(.horizontal, 24)
    }
}

//#Preview {
//    ForgotPasswordView()
//}
