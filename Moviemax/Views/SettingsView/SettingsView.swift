//
//  SettingsView.swift
//  Moviemax
//
//  Created by Julia Martcenko on 14/04/2025.
//

import SwiftUI
import FirebaseAuth

struct SettingsView: View {
	@StateObject var viewModel: SettingsViewModel = SettingsViewModel(user: User(id: "12121", firstName: "Nik", lastName: "Nikitov", password: "qwert", email: "nik@desc.com", dateOfBirth: "21 Sept 1993", gender: "Male", location: "", login: "@nik123"))
	
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
						NavigationLink(destination: ProfileView(user: viewModel.user)) {
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
						SettingsListCell(iconName: "unlock", title: "Forgot Password", isDarkMode: isDarkMode)
						SettingsListDarkModeCell(iconName: "activity", title: "Dark Mode", isDarkMode: $isDarkMode)
					}
					.listRowSeparator(.hidden)

				}
				.textCase(nil)
//				.scrollContentBackground(.hidden)
//				.background(Color.clear)
				.listStyle(PlainListStyle())

				.navigationTitle("Settings")
				.navigationBarTitleDisplayMode(.inline)
				Button(action: {
					viewModel.logOut()
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
		}
	}
}

struct ProfileImageView: View {
	let firstName: String
	let lastName: String
	let login: String

	var body: some View {
		HStack {
			Image("profile")
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
	}
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
	SettingsView(viewModel: SettingsViewModel(user: User(id: "12121", firstName: "Nik", lastName: "Nikitov", password: "qwert", email: "nik@desc.com", dateOfBirth: "21 Sept 1993", gender: "Male", location: "", login: "@nik123")))
}
