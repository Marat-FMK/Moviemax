//
//  ProfileView.swift
//  Moviemax
//
//  Created by Marat Fakhrizhanov on 08.04.2025.
//

import SwiftUI

enum Gender: String {
    case male = "Male"
    case famale = "Female"
}

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewModel()
    @State private var temporaryGender: Gender? = nil
    
    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 20) {
                    
                    CustomTF(answer: $viewModel.firstName, title: "First Name", tfBGtext: "Enter your name", isProfileView: true)
                    CustomTF(answer: $viewModel.lastName, title: "Last Name", tfBGtext: "Enter your surname", isProfileView: true)
                    CustomTF(answer: $viewModel.email, title: "Email", tfBGtext: "Enter your e-mail", isProfileView: true)
                    
                    
                    
                    Text("Gender")
                        .customFont(name: .plusJacartaSemiBold, size: 14)
                        .foregroundStyle(.gray) // FONT
                    
                    HStack {
                        GenderButton(tempGender: $temporaryGender, userGender: temporaryGender, genderName: .male, action: { _ in } )
                        Spacer()
                        GenderButton(tempGender: $temporaryGender, userGender: temporaryGender, genderName: .famale, action: {_ in })
                    }
                }
                .navigationTitle("Profile")
                .navigationBarTitleDisplayMode(.inline)
                .padding(.horizontal, 24)
            }
        }
    }
}

#Preview {
    ProfileView()
}
