//
//  ContentView.swift
//  iOS-SwiftUI-Shopping-App-Demo
//
//  Created by Modi (Victor) Li.
//

import SwiftUI

struct ContentView: View {
    
    init() {
        let appearance = UITabBarAppearance()
        appearance.configureWithDefaultBackground()
        
        appearance.backgroundColor = .white
        appearance.stackedLayoutAppearance.normal.iconColor = UIColor(Color.gray5)
        appearance.stackedLayoutAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor(Color.gray5)]
        
        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = appearance
    }
    
    var body: some View {
        TabView {
            Tab("Explore", systemImage: "square.text.square") {
                ExploreView()
            }
            Tab("Browse", systemImage: "square.grid.2x2") {
                BrowseView()
            }
            Tab("Cart", systemImage: "bag") {
                CartView()
            }
            Tab("Me", systemImage: "person.crop.circle") {
                MeView()
            }
        }
        .accentColor(Color.tint)
    }
}

#Preview {
    ContentView()
}
