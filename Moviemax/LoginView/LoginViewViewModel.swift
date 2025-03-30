//
//  LoginViewViewModel.swift
//  Moviemax
//
//  Created by Marat Fakhrizhanov on 30.03.2025.
//

import Foundation
import SwiftUI

class LoginViewViewModel: ObservableObject {
    
    @Published var userEmail = ""
    @Published var userPassword = ""
    
    @Published var rememberMe = true
    @Published var emailForPasswordChange = ""
    
    
    
    
    
    
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
