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
    
    var body: some View {
        NavigationView{
            ZStack {
                RoundedRectangle(cornerRadius: 24)
                    .foregroundStyle(.green) // white
                VStack(spacing: 10) {
                    
                    Text("Change your picture")
                        .customFont(name: .plusJacartaSemiBold, size: 20)
                    
                    Rectangle().frame(height: 2)
                        .foregroundStyle(.categoryTitle)
                    
                    NavigationLink {
                        VStack {
                            Text("Camera View")
                            Text("take foto and make avatar")
                        }
                        .background(.purple)
                    } label: {
                        AvatarButton(imageName: "camera.fill", text: "Take a photo", destructive: false)
                    }
                    
                    
                    // PHOTOPICKER
                    PhotosPicker(selection: $pickerItem) {
                        AvatarButton(imageName: "folder.fill", text: "Choose from your file", destructive: false)
                    }
                    .frame(width:105, height: 105)
                    .padding(.vertical,10)
                    .onChange(of: pickerItem) { oldValue, newValue in
                        Task {
                            selectedImage = try await pickerItem?.loadTransferable(type: Image.self)
                        }
                    }
                    
                    // DeletePhoto
                    Button{
                        //
                    } label: {
                        AvatarButton(imageName: "", text: "Delete Photo", destructive: true)
                    }
                    
                }
            }
            .frame(width: 328, height: 340)
        }
    }
}

//#Preview {
//    AvatarVeiw(pickerItem: <#Binding<PhotosPickerItem?>#>, selectedImage: <#Binding<Image?>#>)
//}
