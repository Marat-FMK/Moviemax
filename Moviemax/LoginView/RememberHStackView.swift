//
//  RememberHStackView.swift
//  Moviemax
//
//  Created by Marat Fakhrizhanov on 31.03.2025.
//

import SwiftUI

struct RememberHStackView: View {
    @Binding var value: Bool
    
    var body: some View {
        HStack {
            Toggle("", isOn: $value)
                .tint(.toogle)
                .frame(width:50,height: 19)
            
            
            Text("Remember Me")
            
            
            NavigationLink {
                ForgotPasswordView()
            } label: {
                Text("Forgot password?")
                    .foregroundStyle(.forgot)
            }
        }
    }
}

#Preview {
    RememberHStackView(value: .constant(true))
}
