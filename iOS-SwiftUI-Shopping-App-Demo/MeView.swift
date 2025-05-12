//
//  MeView.swift
//  iOS-SwiftUI-Shopping-App-Demo
//
//  Created by Modi (Victor) Li.
//

import SwiftUI

struct MeView: View {
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    NavigationLink {
                        
                    } label: {
                        HStack(spacing: 6) {
                            Image(systemName: "person.crop.circle.fill")
                                .font(.system(size: 50))
                                .foregroundStyle(Color.gray5)
                            VStack {
                                HStack {
                                    Text("Modi Li")
                                        .font(.system(size: 21, weight: .medium))
                                    Spacer()
                                }
                                HStack {
                                    Text("24 orders")
                                        .font(.system(size: 16, weight: .medium))
                                        .foregroundStyle(Color.gray3)
                                    Spacer()
                                }
                            }
                        }
                        .alignmentGuide(.listRowSeparatorLeading) { viewDimensions in
                            return 0
                        }
                    }
                    
                    NavigationLink {
                        PremiumPurchaseView()
                    } label: {
                        Text("Premium")
                            .font(.system(size: 18))
                    }
                }
                Section {
                    NavigationLink {
                        
                    } label: {
                        Text("Orders")
                            .font(.system(size: 18))
                    }
                }
                
                Section {
                    NavigationLink {
                        
                    } label: {
                        Text("Settings")
                            .font(.system(size: 18))
                    }
                    
                    NavigationLink {
                        
                    } label: {
                        Text("About")
                            .font(.system(size: 18))
                    }
                }
            }
            .navigationTitle("Me")
            .navigationBarTitleDisplayMode(.large)
        }
        .tint(Color.gray1)
        .foregroundStyle(Color.gray1)
    }
}

#Preview {
    MeView()
}
