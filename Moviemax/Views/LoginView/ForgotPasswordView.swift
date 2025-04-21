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
    let action: ( ) -> Void
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 50) {
            
            HStack {
				BackButtonView(action: {
                    emailForPasswordChange =  ""
                    dismiss()
                })
                
                Text("Forgot your password")
                    .customFont(name: .plusJacartaSemiBold, size: 18)
                    .padding(.leading, 35) // ???
            }
            
            CustomTF(answer: $emailForPasswordChange, title: "Email", tfBGtext: "Enter your email")
            
            Spacer()
            
            PurpleButton(title: "Submit", action: action)
                .padding(.bottom, 20)
        }
        .navigationBarBackButtonHidden(true)
        .padding(.horizontal, 24)
    }
}

//#Preview {
//    ForgotPasswordView()
//}
