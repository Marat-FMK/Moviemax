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
    @State var authComplete = false
    
    var body: some View {
        NavigationStack {
            VStack {
                
                Text("Login")
                    .customFont(name: .plusJacartaSemiBold, size: 24)
                
                Spacer()
                
                VStack (alignment: .leading, spacing: 10) {
                    CustomTF(answer: $viewModel.userEmail, title: "Email", tfBGtext: "Enter your address")
                    CustomTF(answer: $viewModel.userPassword, title: "Password", tfBGtext: "Enter your password")
                    
                    RememberHStackView(value: $viewModel.rememberMe, emailForPasswordChange: $viewModel.emailForPasswordChange, action: viewModel.passwordСhange)
                    .padding(.top, 20)
                    
                    //buttons
                    VStack(spacing: 16) {

//                        PurpleButton(authComplete: $authComplete, title: "Sign In", action: viewModel.signIn)
                        VStack(spacing: 16) {
                            Button {
                                viewModel.signIn { result in
                                    authComplete = true
                                }
                            } label: {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 24)
                                        .frame(height: 56)
                                        .foregroundStyle(.buttonPurple)
                                    
                                    Text("Sign In")
                                        .customFont(name: .plusJacartaSemiBold, size: 16)
                                        .foregroundStyle(.white)
                                }
                            }
                            .buttonStyle(.plain)
                        }
                        
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
            .navigationDestination(isPresented: $authComplete, destination: {
                TabBarView()
            })
            .sheet(isPresented: $presentSignUP, onDismiss: {
//                viewModel.clearUserInfo()
                viewModel.userPassword = ""
                viewModel.confirmPassword = ""
            }, content: {
                SignUpView(viewModel: viewModel)
            })
            .navigationBarBackButtonHidden(true)
        }
    }
}

//#Preview {
//    LoginView()
//}
