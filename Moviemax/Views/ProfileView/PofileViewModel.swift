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
    
    @State var triggerSaveButton = false
    

    init() {
        setAvatar()
    }
    
    func saveChanges(name: String, surname: String, emailAdress: String, birthday: Date, gend: String, loc: String) {
        Task {
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "d.M.yyyy"
            dateFormatter.dateStyle = .long
            let formattedDate = dateFormatter.string(from: birthday)
            
            await FireBaseDataService.shared.uploudUserInfo(name: name, surname: surname, emailAdress: emailAdress, birthday: formattedDate, gend: gend, loc: loc)
            
        }
        
        if emailAdress != email {
            FireBaseDataService.shared.updateUserEmail(newEmail: emailAdress)
        }
        
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
    
    func setAvatar() {
        var currentImage = Image("profile")
        if UserDefaults.standard.data(forKey: "avatar") != nil {
            guard let data = UserDefaults.standard.data(forKey: "avatar") else { return}
            guard let uiimage = UIImage(data: data) else { return }
            currentImage = Image(uiImage: uiimage)
            self.selectedImage = currentImage
        }
//        return currentImage
//        guard let currentImage = selectedImage else {return Image("profile")}
//        return currentImage
    }
    
    func deleteAvatar() {
        selectedImage = Image("profile")
        //delete image in firebase
    }
    
    func signOut() {
        FireBaseDataService.shared.signOut()
        UserDefaults.standard.set(false, forKey: "authComplete")
    }
    
    func loadFromUD() {
        firstName = UserDefaults.standard.string(forKey: "firstName") ?? ""
        lastName = UserDefaults.standard.string(forKey: "lastName") ?? ""
        email = UserDefaults.standard.string(forKey: "email") ?? ""
        dateOfBirth = UserDefaults.standard.string(forKey: "birthday") ?? ""
        gender = UserDefaults.standard.string(forKey: "gender") ?? ""
        location = UserDefaults.standard.string(forKey: "location") ?? ""
    }
  
}
