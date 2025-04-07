//
//  Extension+Font.swift
//  Moviemax
//
//  Created by Marat Fakhrizhanov on 05.04.2025.
//

import Foundation
import SwiftUI

enum fontsNames: String {
    case montserrat = "Montserrat-Medium"
    case plusJacartaBold = "PlusJakartaSans-ExtraBold"
    case plusJacartaRegular = "PlusJakartaSans-Regular"
    case plusJacartaSemiBold = "PlusJakartaSans-SemiBold"
}

struct SetFont: ViewModifier {
    let name: fontsNames
    let size: Int
    func body(content: Content) -> some View {
        content
            .font(.custom(name.rawValue, size: CGFloat(size)))
    }
}
 
extension View {
    func customFont(name: fontsNames, size: Int) -> some View {
        modifier(SetFont(name: name, size: size))
    }
}
