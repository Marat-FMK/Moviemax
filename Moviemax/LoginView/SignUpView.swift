//
//  SignUpView.swift
//  Moviemax
//
//  Created by Marat Fakhrizhanov on 30.03.2025.
//

import SwiftUI

struct SignUpView: View {
    @ObservedObject var viewModel: LoginViewViewModel
    @Environment(\.dismiss) var dismiss
    
    @State private var seePassword = false
    @State private var seeConfirmPassword = false
    
    @State var presentLogin = false
    
    @State private var alert = false
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    
    var body: some View {
        ScrollView(showsIndicators: false) {
        VStack {
            Text("Sign Up")
                .bold()
            
            VStack (spacing: 20){
                Spacer()
                
                CustomTF(answer: $viewModel.firstName, title: "First name", tfBGtext: "Enter your name")
                CustomTF(answer: $viewModel.lastName, title: "Last name", tfBGtext: "Enter your surname")
                CustomTF(answer: $viewModel.userEmail, title: "Email", tfBGtext: "Enter your address")
                
                CustomSecretPasswordTFView(visible: $seePassword, answer: $viewModel.userPassword, title: "Password")
                
                CustomSecretPasswordTFView(visible: $seeConfirmPassword, answer: $viewModel.confirmPassword, title: "Confirm password")
                
                // SignUP Button
                VStack(spacing: 16) {
                    
                    Button {
                        if viewModel.checkPassword() {
                            viewModel.signUp { result in
                                if result {
                                    presentLogin.toggle()
                                } else {
                                    alertTitle = "Please, try again"
                                    alertMessage = "server error"
                                    alert.toggle()
                                }
                            }
                        } else {
                            alertTitle = "Please, check password"
                            alertMessage = "6+ characters"
                            alert = true
                        }
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 24)
                                .frame(height: 56)
                                .foregroundStyle(.buttonPurple)
                            
                            Text("Sign Up")
                                .foregroundStyle(.white)
                        }
                    }
                    .buttonStyle(.plain)
                }
                
                Spacer()
            }
            
            HStack {
                Text("Already have an account?")
                
                Button{
                    viewModel.clearUserInfo()
                    dismiss()
                } label: {
                    Text("Login")
                        .foregroundStyle(.toogle)
                }
                .buttonStyle(.plain)
            }
        }
    }
        .scrollBounceBehavior(.basedOnSize)
        .onAppear {
            viewModel.clearUserInfo()
        }
        .alert(alertTitle, isPresented: $alert, actions: {
            Button {
                viewModel.userPassword = ""
                viewModel.confirmPassword = ""
            } label: {
                Text("OK")
            }
        }, message: {
            Text(alertMessage)
        })
//        .navigationDestination(isPresented: $presentLogin, destination: {
//            LoginView()
//        })
        .navigationBarBackButtonHidden(true)
        .padding(.horizontal,24)
        .padding(.bottom,20)
    }
}

#Preview {
    SignUpView(viewModel: LoginViewViewModel())
}
