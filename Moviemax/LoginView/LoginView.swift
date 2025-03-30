//
//  LoginView.swift
//  Moviemax
//
//  Created by Marat Fakhrizhanov on 30.03.2025.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var viewModel = LoginViewViewModel()
    var body: some View {
        NavigationView {
            VStack {
                
                Text("Login")
                    .font(.system(size: 24))
                    .bold()
                
                Spacer()
                
                VStack (alignment: . leading, spacing: 10) {
                    CustomTF(answer: $viewModel.userEmail, title: "Email", tfBGtext: "Enter your address")
                    CustomTF(answer: $viewModel.userPassword, title: "Password", tfBGtext: "Enter your password")
                    
                    RememberHStackView(value: $viewModel.rememberMe)
                    .padding(.top, 20)
                    
                    //BUTTONs
                    VStack(spacing: 16) {
                        LongPurpleButton(title: "Sign In", action: viewModel.signIn)
                    //divider
                        HStack {
                            Rectangle()
                                .frame(height: 2)
                                .foregroundStyle(.divider)
                            
                            Text("Or continue with")
                                .frame(width: 150)
                                .foregroundStyle(.divider)
                            
                            Rectangle()
                                .frame(height: 2)
                                .foregroundStyle(.divider)
                        }
                        .padding(.horizontal,30)
                        
                        
                    //google button
                       
                    }
                    .padding(.top, 50)
                }
                
                Spacer()
                
                //SIGN UP text
                HStack {
                    Text("Don't have an account?")
                    
                    NavigationLink {
                        SignUpView()
                    } label: {
                        Text("Sign up")
                            .foregroundStyle(.forgot)
                    }
                }
                .padding(.bottom, 20)
                
                
            }
            .padding(.horizontal, 24)
        }
    }
}

#Preview {
    LoginView()
}
