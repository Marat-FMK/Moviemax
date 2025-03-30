//
//  SignUpView.swift
//  Moviemax
//
//  Created by Marat Fakhrizhanov on 30.03.2025.
//

import SwiftUI

struct SignUpView: View {
    @StateObject var viewModel = LoginViewViewModel()
    @State private var seePassword = false
    @State private var seeConfirmPassword = false
    @Environment(\.dismiss) var dismiss
    @State var presentLogin = false
    
    var body: some View {
        VStack {
            Text("Sign Up")
                .bold()
            
            VStack (spacing: 20){
                Spacer()
                
                CustomTF(answer: $viewModel.firstName, title: "First name", tfBGtext: "Enter your name")
                CustomTF(answer: $viewModel.firstName, title: "Last name", tfBGtext: "Enter your surname")
                CustomTF(answer: $viewModel.firstName, title: "Email", tfBGtext: "Enter your address")
                
                CustomSecretPasswordTFView(visible: $seePassword, answer: $viewModel.userPassword, title: "Password")
                CustomSecretPasswordTFView(visible: $seeConfirmPassword, answer: $viewModel.confirmPassword, title: "Confirm password")
                
                LongPurpleButton(title: "Sign Up", action: viewModel.signUp)
                
                Spacer()
            }
            
            HStack {
                Text("Already have an account?")
                
                Button{
                    presentLogin.toggle()
                } label: {
                    Text("Login")
                        .foregroundStyle(.forgot)
                }
                .buttonStyle(.plain)
            }
        }
        .navigationDestination(isPresented: $presentLogin, destination: {
            LoginView()
        })
        .navigationBarBackButtonHidden(true)
        .padding(.horizontal,24)
        .padding(.bottom,20)
    }
}

#Preview {
    SignUpView()
}
