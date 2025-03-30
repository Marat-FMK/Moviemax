//
//  LoginViewViewModel.swift
//  Moviemax
//
//  Created by Marat Fakhrizhanov on 30.03.2025.
//

import Foundation
import SwiftUI

//import fireBase

class LoginViewViewModel: ObservableObject {
    
    @Published var firstName = ""
    @Published var lastName = ""
    @Published var userEmail = ""
    @Published var userPassword = ""
    @Published var confirmPassword = ""
    
    @Published var rememberMe = true
    @Published var emailForPasswordChange = ""
    
    
    
    func signUp() {
        //firebase
    }
    
    func signIn() {
        //firebase
    }
    
    func passwordСhange() {
        // firebase
        // and clear emailForPasswordChange
    }
    func authWithGoogle() {
        //firebase
    }
    
    
}
