//
//  FilterView.swift
//  Moviemax
//
//  Created by Marat Fakhrizhanov on 01.04.2025.
//

import SwiftUI

struct FilterView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            
            HStack{
                Image(systemName: "xmark")
                    .resizable()
                    .scaledToFit()
                    .frame( height: 12)
                Text("Filter")
                    .font(.system(size: 18))
                Spacer()
                Button {
                    
                } label: {
                    Text("Reset Filters")
                        .font(.system(size: 14))
                }
            }
            
            Text("Categories")
                .font(.system(size: 16))
                .bold()
            
            HStack{
                
            }
        }
        .padding(.horizontal, 30)
    }
}

#Preview {
    FilterView()
}
