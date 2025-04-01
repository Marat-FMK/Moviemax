//
//  SearchField.swift
//  Moviemax
//
//  Created by Marat Fakhrizhanov on 01.04.2025.
//

import SwiftUI

struct SearchField: View {
    @Binding var searchText: String
    @Binding var presentFilter: Bool
    let action: () -> Void // start search
    
    var body: some View {
        
        
        ZStack{
            RoundedRectangle(cornerRadius: 24).stroke(style: StrokeStyle(lineWidth: 2))
                .foregroundStyle(.buttonPurple)
                .frame(height: 52)
            HStack{
                Button{
                    action()
                } label: {
                    Image(systemName: "magnifyingglass")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 18)
                }
                .buttonStyle(.plain)
                
                TextField("SearchText", text: $searchText)
                    .onSubmit {
                        action()
                    }
                
                Button{
                    searchText = ""
                } label: {
                    Image(systemName: "xmark")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 18)
                }
                .buttonStyle(.plain)
                
                Divider()
                    .frame(height: 18)
                
                Button{
                    presentFilter.toggle()
                } label: {
                    Image(systemName: "slider.horizontal.3")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 18)
                }
                .buttonStyle(.plain)
            }
            .padding(.horizontal,15)
        }
        
    }
}

#Preview {
    SearchField(searchText: .constant("Drifting"), presentFilter: .constant(false), action: { print("start search preview")})
}
