//
//  RememberHStackView.swift
//  Moviemax
//
//  Created by Marat Fakhrizhanov on 31.03.2025.
//

import SwiftUI

struct RememberHStackView: View {
    @Binding var value: Bool
    @Binding var emailForPasswordChange: String
    let action: ()->Void
    
    var body: some View {
        HStack {
            Toggle("", isOn: $value)
                .tint(.toogle)
                .frame(width:50,height: 19)
            
            
            Text("Remember Me")
            
            
            NavigationLink {
                ForgotPasswordView(emailForPasswordChange: $emailForPasswordChange, action: action)
            } label: {
                Text("Forgot password?")
                    .foregroundStyle(.toogle)
            }
        }
    }
}

//#Preview {
//    RememberHStackView(value: .constant(true))
//}
