//
//  DemoData.swift
//  iOS-SwiftUI-Shopping-App-Demo
//
//  Created by Modi (Victor) Li.
//

import SwiftUI

struct ProductCategory {
    let name: String
    let products: [String:[Product]]
}

class DemoData {
    
    static let productBackgroundColor1 = Color.fromRGB(red: 255, green: 246, blue: 246)
    static let productBackgroundColor2 = Color.fromRGB(red: 242, green: 247, blue: 255)
    static let productBackgroundColor3 = Color.fromRGB(red: 243, green: 252, blue: 244)
    static let productBackgroundColor4 = Color.fromRGB(red: 255, green: 250, blue: 246)
    static let productBackgroundColor5 = Color.fromRGB(red: 251, green: 247, blue: 255)
    
    static let homeProducts = [
        ProductCategory(
            name: "Recommended",
            products: [
                "Featured": [
                    Product(title: "Chocolate Cookies", price: 2.80, backgroundColor: productBackgroundColor1),
                    Product(title: "Ice Cream", price: 4.00, backgroundColor: productBackgroundColor2),
                    Product(title: "Coffee Beans", price: 12.90, backgroundColor: productBackgroundColor3),
                    Product(title: "Toothpaste", price: 6.98, backgroundColor: productBackgroundColor4)
                ],
                "All": [
                    Product(title: "Bread", price: 5.99, backgroundColor: productBackgroundColor5),
                    Product(title: "Potato Chips", price: 3.00, backgroundColor: productBackgroundColor4),
                    Product(title: "Milk Chocolate", price: 9.00,  backgroundColor: productBackgroundColor3),
                    Product(title: "Ketchup", price: 3.99, backgroundColor: productBackgroundColor2),
                    Product(title: "Orange Juice", price: 3.98, backgroundColor: productBackgroundColor1),
                    Product(title: "Shampoo", price: 8.90, backgroundColor: productBackgroundColor5)
                ]
            ]),
        ProductCategory(
            name: "Beverages",
            products: [
                "Featured": [
                    Product(title: "Orange Juice", price: 3.98, backgroundColor: productBackgroundColor1),
                    Product(title: "Water", price: 1.80, backgroundColor: productBackgroundColor2),
                    Product(title: "Apple Juice", price: 3.98, backgroundColor: productBackgroundColor3),
                    Product(title: "Sparkling Water", price: 1.20, backgroundColor: productBackgroundColor4),
                ],
                "All": [
                    Product(title: "Sparkling Water", price: 1.20, backgroundColor: productBackgroundColor5),
                    Product(title: "Iced Tea", price: 4.20, backgroundColor: productBackgroundColor4),
                    Product(title: "Lemonade", price: 3.00, backgroundColor: productBackgroundColor3),
                    Product(title: "Coffee Drink", price: 2.52, backgroundColor: productBackgroundColor2),
                    Product(title: "Strawberry Lemonade", price: 3.28, backgroundColor: productBackgroundColor1),
                ]
            ]),
        ProductCategory(
            name: "Snacks",
            products: [
                "Featured": [
                    
                ],
                "All": [
                    
                ]
            ]),
        ProductCategory(
            name: "Coffee & Tea",
            products: [
                "Featured": [
                    
                ],
                "All": [
                    
                ]
            ]),
        ProductCategory(
            name: "Meat",
            products: [
                "Featured": [
                    
                ],
                "All": [
                    
                ]
            ]),
        ProductCategory(
            name: "Seafood",
            products: [
                "Featured": [
                    
                ],
                "All": [
                    
                ]
            ]),
        ProductCategory(
            name: "Dairy & Eggs",
            products: [
                "Featured": [
                    
                ],
                "All": [
                    
                ]
            ]),
        ProductCategory(
            name: "Frozen",
            products: [
                "Featured": [
                    
                ],
                "All": [
                    
                ]
            ]),
    ]
    
    static let description = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.\nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.\nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."
    
}
