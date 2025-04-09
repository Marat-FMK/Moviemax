//
//  RpofileViewModel.swift
//  Moviemax
//
//  Created by Marat Fakhrizhanov on 08.04.2025.
//

import Foundation

class ProfileViewModel: ObservableObject {
    
    @Published var firstName = ""
    @Published var lastName = ""
    @Published var email = ""
    @Published var dateOfBirth = ""
    @Published var gender = ""
    @Published var location = ""
    
    @Published var userGender: Gender? = nil
    
    func saveChanges() {
        // all in firebase
    }
    
    
}
