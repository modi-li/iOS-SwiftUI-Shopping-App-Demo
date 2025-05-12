//
//  Models.swift
//  iOS-SwiftUI-Shopping-App-Demo
//
//  Created by Modi (Victor) Li.
//

import Foundation
import SwiftUI

struct Product: Identifiable {
    
    let id: UUID
    let title: String
    let price: Double
    let backgroundColor: Color
    
    init(title: String, price: Double, backgroundColor: Color) {
        self.id = UUID()
        self.title = title
        self.price = price
        self.backgroundColor = backgroundColor
    }
    
    init() {
        self.id = UUID()
        self.title = ""
        self.price = 0
        self.backgroundColor = Color.white
    }
    
    var priceDisplay: String {
        return String(format: "%.2f", price)
    }
    
    var priceSplittedStrings: (integerPart: String, decimalPart: String) {
        let integerPart = Int(price)
        let decimalPart = String(format: "%.2f", price - Double(integerPart))
        return (String(integerPart), String(decimalPart.dropFirst(1)))
    }
}
