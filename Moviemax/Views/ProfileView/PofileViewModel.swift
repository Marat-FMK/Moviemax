//
//  RpofileViewModel.swift
//  Moviemax
//
//  Created by Marat Fakhrizhanov on 08.04.2025.
//

import Foundation
import SwiftUI
import PhotosUI

class ProfileViewModel: ObservableObject {
    
    @Published var pickerItem: PhotosPickerItem?
    @Published var selectedImage: Image?
    
    @Published var firstName = ""
    @Published var lastName = ""
    @Published var email = ""
    @Published var dateOfBirth = ""
    @Published var gender = ""
    @Published var location = ""
    
    @Published var userGender: Gender? = nil
    @Published var userInfo: User
    
    @State var triggerSaveButton = false
    
	init(user: User) {
        // fetch user info
		self.userInfo = user

        self.firstName = userInfo.firstName
        self.lastName = userInfo.lastName
        self.email = userInfo.email
        self.dateOfBirth = userInfo.dateOfBirth
        self.gender = userInfo.gender
        self.location = userInfo.location
    }
    
    func saveChanges(name: String, surname: String, emailAdress: String, birthday: String, gend: String, loc: String) {
        // all in firebase
        triggerSaveButton = false
    }
    
    func checkCangeInProfile(name: String, surname: String, emailAdress: String, birthday: String, gend: String, loc: String) -> Bool {
        if firstName == name && surname == lastName && emailAdress == email && birthday == dateOfBirth && gender == gend && loc == location && triggerSaveButton == false {
            return true
        } else {
            return false
        }
    }
    
    func setBDDate(date: Date) {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d.M.yyyy"
        dateFormatter.dateStyle = .long
        let formattedDate = dateFormatter.string(from: date)
        
        dateOfBirth = formattedDate
    }
    
    func setAvatar()-> Image {
        guard let currentImage = selectedImage else {return Image("profile")}
        return currentImage
        
    }
    
    func deleteAvatar() {
        selectedImage = Image("profile")
        //delete image in firebase
    }
    
}
