//
//  LoginView.swift
//  Moviemax
//
//  Created by Marat Fakhrizhanov on 30.03.2025.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewViewModel()
    
    @State var presentSignUP = false
    
    var body: some View {
        NavigationStack {
            VStack {
                
                Text("Login")
                    .customFont(name: .plusJacartaSemiBold, size: 24)
                
                Spacer()
                
                VStack (alignment: .leading, spacing: 10) {
                    CustomTF(answer: $viewModel.userEmail, title: "Email", tfBGtext: "Enter your address")
                    CustomTF(answer: $viewModel.userPassword, title: "Password", tfBGtext: "Enter your password")
                    
                    RememberHStackView(value: $viewModel.rememberMe)
                    .padding(.top, 20)
                    
                    //BUTTONs
                    VStack(spacing: 16) {
                        PurpleButton(title: "Sign In", action: viewModel.signIn)
                    //divider
                        HStack {
                            Rectangle()
                                .frame(height: 2)
                                .foregroundStyle(.divider)
                            
                            Text("Or continue with")
                                .customFont(name: .plusJacartaSemiBold, size: 14)
                                .frame(width: 150)
                                .foregroundStyle(.divider)
                            
                            Rectangle()
                                .frame(height: 2)
                                .foregroundStyle(.divider)
                        }
                        .padding(.horizontal,30)
                        
                        
                    //google button
                        GoogleButton(action: viewModel.authWithGoogle)
                    }
                    .padding(.top, 50)
                }
                
                Spacer()
                
                //SIGN UP text
                HStack {
                    Text("Don't have an account?")
                    
                   Button {
                       presentSignUP.toggle()
                    } label: {
                        Text("Sign up")
                            .foregroundStyle(.toogle)
                    }
                }
                .padding(.bottom, 20)
            }
            .padding(.horizontal, 24)
            .sheet(isPresented: $presentSignUP, onDismiss: {
                viewModel.clearUserInfo()
            }, content: {
                SignUpView(viewModel: viewModel)
            })
            .navigationBarBackButtonHidden(true)
        }
    }
}

#Preview {
    LoginView()
}
