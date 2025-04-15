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
	@StateObject var viewModel: ProfileViewModel
    @Environment(\.dismiss) var dismiss
    @State private var trigger = false
    
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var email = ""
    @State private var dateOfBirdth = ""
    @State private var gender = ""
    @State private var location = ""
    
    @State private var presentAlert = false
    @State private var blurValue = 0
    
    @State private var presentCalendar = false
    @State var chooseDate = Date.now

	init(user: User) {
		_viewModel = StateObject(wrappedValue: ProfileViewModel(user: user))
	}

    var body: some View {
        ZStack {
            
            if presentAlert {
                AvatarVeiw(pickerItem: $viewModel.pickerItem, selectedImage: $viewModel.selectedImage, action: viewModel.deleteAvatar)
                    .zIndex(1.0)
                Spacer()
            }
            
            NavigationView {
                ScrollView(showsIndicators: false) {
                    
                    Button {
                        presentAlert.toggle() // = true
                        if blurValue == 0 {
                            blurValue = 5
                        } else {
                            blurValue = 0
                        }
                    } label: {
                        ZStack {
                            viewModel.setAvatar()
                                .resizable()
                                .scaledToFill()
                                .foregroundStyle(.liteGray)
                                .clipShape(Circle())
                                .overlay(content: {
                                    Circle().stroke(lineWidth: 7)
                                        .foregroundStyle(.liteGray)
                                        .shadow(color: .gray.opacity(0.5), radius: 5)
                                })
                            Image(systemName: "pencil.circle")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20)
                                .background(.buttonPurple)
                                .foregroundStyle(.white)
                                .clipShape(Circle())
                                .offset(x: 35, y: 35)
                            
                        }
                    }
                    .frame(width:105, height: 105)
                    .padding(.top, 40)
                    
                    
                    VStack(alignment: .leading, spacing: 20) {
                        
                        // TFIELDS
                        ProfileTextFields(trigger: $trigger, answer: $firstName, title: "FirstName", tfBGtext: "Enter your name")
                        ProfileTextFields(trigger: $trigger, answer: $lastName, title: "LastName", tfBGtext: "Enter your surname")
                        ProfileTextFields(trigger: $trigger, answer: $email, title: "Email", tfBGtext: "Enter your email")
                        
                        // CALENDAR Date picker
                        BirthDayTextView(presentCalendar: $presentCalendar, date: viewModel.dateOfBirth, title: "Date of Birth")
                        
                        if presentCalendar{
                            DatePicker("Select your birthday", selection: $chooseDate, displayedComponents: .date)
                                .datePickerStyle(.compact)
                                .onChange(of: chooseDate) {  newValue in
                                    viewModel.triggerSaveButton = true
                                    viewModel.setBDDate(date: chooseDate)
                                    withAnimation {
                                        presentCalendar = false
                                    }
                                }
                        }
                        
                        //GENDER
                        Text("Gender")
                            .customFont(name: .plusJacartaSemiBold, size: 14)
                            .foregroundStyle(.loginTitle)
                        
                        HStack {
                            GenderButton(gender: $gender, genderName: .male)
                            Spacer()
                            GenderButton(gender: $gender, genderName: .famale)
                        }
                        
                        Text("Location")
                            .customFont(name: .plusJacartaSemiBold, size: 14)
                            .foregroundStyle(.loginTitle)
                            .padding(.top, 10)
                        
                        TextEditor( text: $viewModel.location)
                            .padding(15)
                            .overlay {
                                RoundedRectangle(cornerRadius: 24)
                                    .stroke(lineWidth: 1)
                                    .foregroundStyle(.onboardingBackground)
                            }
                        
                        
                        if viewModel.checkCangeInProfile(name: firstName, surname: lastName, emailAdress: email, birthday: dateOfBirdth, gend: gender, loc: location) {
                            VStack(spacing: 16) {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 24)
                                        .frame(height: 56)
                                        .foregroundStyle(.liteGray)  /// ???
                                    
                                    Text("Save Changes")
                                        .customFont(name: .plusJacartaSemiBold, size: 16)
                                        .foregroundStyle(.loginTFText)
                                }
                            }
                        } else {
                            VStack(spacing: 16) {
                                Button {
                                    viewModel.saveChanges(name: firstName, surname: lastName, emailAdress: email, birthday: dateOfBirdth, gend: gender, loc: location)
                                    
                                    dismiss()
                                } label: {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 24)
                                            .frame(height: 56)
                                            .foregroundStyle(.buttonPurple)
                                        
                                        Text("Save Changes")
                                            .customFont(name: .plusJacartaSemiBold, size: 16)
                                            .foregroundStyle(.white)
                                    }
                                }
                                .buttonStyle(.plain)
                            }
                        }
                    }
                    .onAppear {
                        firstName = viewModel.firstName
                        lastName = viewModel.lastName
                        email = viewModel.email
                        dateOfBirdth = viewModel.dateOfBirth
                        gender = viewModel.gender
                        location = viewModel.location
                    }
                    .navigationTitle("Profile")
                    .navigationBarTitleDisplayMode(.inline)
                    .padding(.horizontal, 24)
                }
                .toolbar(content: {
                    ToolbarItem(placement: .topBarLeading) {
                        Button {
                            dismiss()
                        } label: {
                            ZStack{
                                Circle()
                                    .frame(width: 48, height: 48)
                                    .foregroundStyle(.backButtonBG)
                                
                                Image(systemName: "arrow.left")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 14)
                            }
                        }
                        .buttonStyle(.plain)
                    }
                })
                .blur(radius: CGFloat(blurValue))
                
            }
			.navigationBarBackButtonHidden(true)
        }
    }
}

#Preview {
	ProfileView(user: User(id: "12121", firstName: "Nik", lastName: "Nikitov", password: "qwert", email: "nik@desc.com", dateOfBirth: "21 Sept 1993", gender: "Male", location: "", login: "@nik123"))
}
