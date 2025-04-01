//
//  LoginViewViewModel.swift
//  Moviemax
//
//  Created by Marat Fakhrizhanov on 30.03.2025.
//

import Foundation
import SwiftUI
import FirebaseAuth
import GoogleSignIn

class LoginViewViewModel: ObservableObject {
    
    @Published var firstName = ""
    @Published var lastName = ""
    @Published var userEmail = ""
    @Published var userPassword = ""
    @Published var confirmPassword = ""
    
    @Published var rememberMe = true
    @Published var emailForPasswordChange = ""
    
    var authComplete = false // UserDef
    
    func signUp(completion: @escaping(Bool)->Void) {
        Auth.auth().createUser(withEmail: userEmail, password: userPassword) { data, error in
            if data != nil {
                completion(true)
                print("firebase new user registration - OK")
            } else {
                completion(false)
            }
        }
    }
    
    func signIn() {
        Auth.auth().signIn(withEmail: userEmail, password: userPassword) { result,error  in
            if result != nil {
                self.authComplete = true
                print("auth COMPLETE")
            } else {
                print("auth ERROR in signIn")
            }
        }
    }
    
    func passwordСhange() {
        // firebase
        // and clear emailForPasswordChange
    }
    func authWithGoogle() {
        //firebase // Обновил plist ^ дошел до OAuth
    }
    
    func clearUserInfo() {
        firstName = ""
        lastName = ""
        userEmail = ""
        userPassword = ""
        confirmPassword = ""
    }
    
    func checkPassword() -> Bool {
        if userPassword.count >= 6 && userPassword == confirmPassword {
            print("check password - OK")
            return true
        }
        return false
    }
    
    
}
