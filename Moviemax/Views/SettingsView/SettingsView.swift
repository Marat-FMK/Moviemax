//
//  SettingsView.swift
//  Moviemax
//
//  Created by Julia Martcenko on 14/04/2025.
//

import SwiftUI

struct SettingsView: View {
	@StateObject var viewModel: SettingsViewModel

    var body: some View {
		VStack {
			ProfileImageView(name: viewModel.name, surname: viewModel.surname, login: viewModel.login)
			List {
				Section("Personal Info") {

				}
			}
		}
    }
}

struct ProfileImageView: View {
	let name: String
	let surname: String
	let login: String

	var body: some View {
		HStack {
			Image("profile")
				.resizable()
				.scaledToFill()
				.frame(width: 40, height: 40)
				.clipShape(Circle())
				.clipped()
			VStack(alignment: .leading) {
				Text("\(name) \(surname)")
					.customFont(name: .plusJacartaBold, size: 18)
					.foregroundStyle(.textBlack)
				Text(login)
					.customFont(name: .plusJacartaRegular, size: 12)
					.foregroundStyle(.subtextGray)
			}
		}
	}
}

#Preview {
	SettingsView(viewModel: SettingsViewModel(name: "Andy", surname: "Lexian", login: "@Andy1999"))
}
