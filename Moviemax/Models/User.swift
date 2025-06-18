//
//  NewUser.swift
//  Moviemax
//
//  Created by Marat Fakhrizhanov on 07.04.2025.
//

import Foundation
import SwiftUI

struct User: Identifiable, Codable {
    
    let id: String?
    let firstName: String?
    let lastName: String? 
    let email: String?
    let dateOfBirth: String?
    let gender: String?
    let location: String?
    
}
