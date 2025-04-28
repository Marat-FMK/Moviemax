//
//  Avatar Veiw.swift
//  Moviemax
//
//  Created by Marat Fakhrizhanov on 12.04.2025.
//

import SwiftUI
import PhotosUI

struct AvatarVeiw: View {
    @Binding var pickerItem: PhotosPickerItem?
    @Binding var selectedImage: Image?
    let action: () -> Void
    
    var body: some View {
            ZStack {
                
                RoundedRectangle(cornerRadius: 24)
                    .foregroundStyle(.whiteBackground)
                    .shadow(color: . gray, radius: 20)
                VStack(spacing: 15) {
                    
                    Text("Change your picture")
                        .customFont(name: .plusJacartaSemiBold, size: 20)
                        .frame(height: 60)
                    
                    Rectangle().frame(height: 1)
                        .foregroundStyle(.heartNoFill)
                    
                    //CAMERA BUTTON
                    Button {
                         // go to camera
                    } label: {
                        AvatarButton(imageName: "camera.fill", text: "Take a photo", destructive: false)
                    }
                    
                    // PHOTOPICKER
                    PhotosPicker(selection: $pickerItem) {
                        AvatarButton(imageName: "folder.fill", text: "Choose from your file", destructive: false)
                    }
                    .onChange(of: pickerItem) { newValue in
                        Task {
                            if let item = newValue {
                                selectedImage = try? await item.loadTransferable(type: Image.self)
                                let data = try? await item.loadTransferable(type: Data.self)
                                print("data ---->> save")
                                UserDefaults.standard.set(data, forKey: "avatar")
                                
                            }
                        }
                    }
                    
                    // DeleteAvater BUTTON
                    Button{
                        action()
                    } label: {
                        AvatarButton(imageName: "xmark.bin.fill", text: "Delete Photo", destructive: true)
                    }
                    .buttonStyle(.plain)
                    
                    
                }
            }
            .frame(width: 328, height: 340)
        
    }
}

//#Preview {
//    AvatarVeiw(viewModel: ProfileViewModel())
//}
