//
//  BrowseView.swift
//  iOS-SwiftUI-Shopping-App-Demo
//
//  Created by Modi (Victor) Li.
//

import SwiftUI

struct BrowseView: View {
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.gray8
                    .ignoresSafeArea()
                
            }
            .navigationTitle("Browse")
            .navigationBarTitleDisplayMode(.inline)
        }
        .foregroundStyle(Color.gray1)
    }
    
}

#Preview {
    BrowseView()
}
