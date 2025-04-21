//
//  ChangePasswordView.swift
//  Moviemax
//
//  Created by Julia Martcenko on 21/04/2025.
//

import SwiftUI

struct ChangePasswordView: View {
	@StateObject var viewModel = LoginViewViewModel()
	@Environment(\.dismiss) var dismiss

	@State private var newPassword: String = ""
	@State private var repeatNewPassword: String = ""

    var body: some View {
		VStack {
			List {
				Section {
					CustomTF(answer: $viewModel.userPassword, title: "Currant password", tfBGtext: "Enter your current password")
					CustomTF(answer: $newPassword, title: "New password", tfBGtext: "Enter new password")
					CustomTF(answer: $repeatNewPassword, title: "Repeat new password", tfBGtext: "Repeat new password")
				}
				.listRowSeparator(.hidden)
			}
			.navigationBarBackButtonHidden(true)
			.scrollIndicators(.hidden)
			.navigationBarTitleDisplayMode(.inline)
			.listStyle(PlainListStyle())
			.textCase(nil)
			.toolbar {
				ToolbarItem(placement: .principal) {
					Text("Change password")
						.customFont(name: .plusJacartaSemiBold, size: 18)
						.foregroundStyle(.textBlack)
				}
				ToolbarItem(placement: .navigationBarLeading) {
					BackButtonView(action: { dismiss() })
				}
			}
			PurpleButton(title: "Change", action: viewModel.passwordСhange)
				.padding(.bottom, 20)
				.padding(.horizontal, 24)
		}
    }
}

#Preview {
    ChangePasswordView()
}
