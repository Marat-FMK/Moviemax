//
//  NewUser.swift
//  Moviemax
//
//  Created by Marat Fakhrizhanov on 07.04.2025.
//

import Foundation
import SwiftUI
import Firebase
import FirebaseFirestore

struct NewUser: Identifiable, Codable {
//    @DocumentID var id: String? = UUID().uuidString
    
    let id: String
    let name: String
    let surname: String
    let email: String
    let birthday: String
    let gender: String
    let location: String
}

//struct User {
//    var userID: String
//    var name: String
//    var surname: String
//    var email: String
//    var birthday: String
//    var gender: String
//    var location: String
//}
