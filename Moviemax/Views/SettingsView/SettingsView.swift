//
//  SettingsView.swift
//  Moviemax
//
//  Created by Julia Martcenko on 14/04/2025.
//

import SwiftUI
import FirebaseAuth

struct SettingsView: View {
	@StateObject var viewModel: SettingsViewModel = SettingsViewModel()
	@State private var presentLoginView = false
    
	@AppStorage("isDarkMode") private var isDarkMode: Bool = false

	var body: some View {
		NavigationStack {
			VStack(alignment: .leading) {
				ProfileImageView(firstName: viewModel.firstName, lastName: viewModel.lastName, login: viewModel.login)
					.padding(.horizontal, 24)
				List {
					Section(header:
								Text("Personal Info")
						.customFont(name: .plusJacartaRegular, size: 12)
						.foregroundStyle(.textBlack)
					) {
						NavigationLink(destination: ProfileView()) {
							SettingsListCell(iconName: "person", title: "Profile", isDarkMode: isDarkMode)
						}
					}
					.listRowSeparator(.hidden)
					Section(header:
								Text("Security")
						.customFont(name: .plusJacartaRegular, size: 12)
						.foregroundStyle(.textBlack)
					){
						SettingsListCell(iconName: "lock", title: "Change Password", isDarkMode: isDarkMode)
							.background(
								NavigationLink("", destination: ChangePasswordView())
									.opacity(0)
							)
						SettingsListCell(iconName: "unlock", title: "Forgot Password", isDarkMode: isDarkMode)
							.background(
                                NavigationLink("", destination: ForgotPasswordView(emailForPasswordChange: $viewModel.emailForChangePassword, action: viewModel.changePasswordWithEmail))
									.opacity(0)
							)
						SettingsListDarkModeCell(iconName: "activity", title: "Dark Mode", isDarkMode: $isDarkMode)
					}
					.listRowSeparator(.hidden)

				}
				.textCase(nil)
//				.scrollContentBackground(.hidden)
//				.background(Color.clear)
				.listStyle(PlainListStyle())
				.navigationBarTitleDisplayMode(.inline)
				Button(action: {
					viewModel.logOut()
//                    presentLoginView.toggle()
				}) {
					Text("Log Out")
						.customFont(name: .plusJacartaBold, size: 16)
						.foregroundStyle(.buttonPurple)
						.frame(maxWidth: .infinity)
						.padding()
						.background(Color(.whiteBackground))
						.cornerRadius(32)
						.overlay {
							RoundedRectangle(cornerRadius: 32)
								.stroke(lineWidth: 1)
								.foregroundStyle(.onboardingBackground)
						}
				}
				.padding(.horizontal, 24)
				.padding(.bottom, 12)
			}
            .onAppear {
                viewModel.loudFromUD()
            }
//            .navigationDestination(isPresented: $presentLoginView, destination: { LoginView()})
			.toolbar {
				ToolbarItem(placement: .principal) {
					Text("Settings")
						.customFont(name: .plusJacartaSemiBold, size: 18)
						.foregroundStyle(.textBlack)
				}
			}
		}
	}
}

struct ProfileImageView: View {
    @StateObject var viewModel = ProfileViewModel()
	let firstName: String
	let lastName: String
	let login: String
    
	var body: some View {
		HStack {
            viewModel.selectedImage! // UNWRAP
				.resizable()
				.scaledToFill()
				.frame(width: 56, height: 56)
				.clipShape(Circle())
				.clipped()
				.padding(.trailing, 12)
			VStack(alignment: .leading) {
				Text("\(firstName) \(lastName)")
					.customFont(name: .plusJacartaBold, size: 18)
					.foregroundStyle(.textBlack)
				Text(login)
					.customFont(name: .plusJacartaRegular, size: 12)
					.foregroundStyle(.subtextGray)
			}
		}
        .onAppear {
            viewModel.setAvatar()
        }
	}
    
//    func loudImage() -> Image {
//        var currentAvatar = Image("profile")
//        
//        guard let data = UserDefaults.standard.data(forKey: "avatar") else { return currentAvatar}
//        guard let uiImage = UIImage(data: data) else { return currentAvatar}
//        currentAvatar = Image(uiImage: uiImage)
//        return currentAvatar
//    }
}

struct SettingsListCell: View {
	let iconName: String
	let title: String
	let isDarkMode: Bool

	var body: some View {
		HStack {
			Image(isDarkMode ? "dark\(iconName)" : iconName)
			Text(title)
				.customFont(name: .plusJacartaSemiBold, size: 16)
		}
	}
}

struct SettingsListDarkModeCell: View {
	let iconName: String
	let title: String
	@Binding var isDarkMode: Bool

	var body: some View {
		HStack {
			Image(isDarkMode ? "dark\(iconName)" : iconName)
			Text(title)
				.customFont(name: .plusJacartaSemiBold, size: 16)
			Spacer()
			Toggle("", isOn: $isDarkMode)
				.labelsHidden()
				.tint(.buttonPurple)
		}
	}
}

#Preview {
	SettingsView()
}
