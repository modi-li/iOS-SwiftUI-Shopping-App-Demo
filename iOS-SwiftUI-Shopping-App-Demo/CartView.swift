//
//  CartView.swift
//  iOS-SwiftUI-Shopping-App-Demo
//
//  Created by Modi (Victor) Li.
//

import SwiftUI

struct CartView: View {
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.gray8
                    .ignoresSafeArea()
                
            }
            .navigationTitle("Cart")
            .navigationBarTitleDisplayMode(.inline)
        }
        .foregroundStyle(Color.gray1)
    }
    
}

#Preview {
    CartView()
}
