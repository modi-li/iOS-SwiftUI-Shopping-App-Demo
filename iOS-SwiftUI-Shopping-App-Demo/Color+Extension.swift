//
//  Color+Extension.swift
//  iOS-SwiftUI-Shopping-App-Demo
//
//  Created by Modi (Victor) Li.
//

import SwiftUI

extension Color {
    
    static func fromRGB(red: Double, green: Double, blue: Double) -> Color {
        return Color(red: red / 255.0, green: green / 255.0, blue: blue / 255.0)
    }
    
    static let tint = fromRGB(red: 51, green: 115, blue: 229)
    
    static let tintLight = fromRGB(red: 80, green: 140, blue: 244)
    
    static let gray1 = fromRGB(red: 31, green: 31, blue: 34)
    
    static let gray2 = fromRGB(red: 60, green: 60, blue: 63)
    
    static let gray3 = fromRGB(red: 88, green: 88, blue: 91)
    
    static let gray4 = fromRGB(red: 124, green: 124, blue: 127)
    
    static let gray5 = fromRGB(red: 175, green: 175, blue: 178)
    
    static let gray6 = fromRGB(red: 240, green: 240, blue: 243)
    
    static let gray7 = fromRGB(red: 245, green: 245, blue: 248)
    
    static let gray8 = fromRGB(red: 250, green: 250, blue: 253)
}
