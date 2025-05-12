//
//  PremiumPurchaseView.swift
//  iOS-SwiftUI-Shopping-App-Demo
//
//  Created by Modi (Victor) Li.
//

import SwiftUI

struct PremiumFeatureItem: Identifiable {
    
    let id: UUID
    let title: String
    let image: String
    
    init(title: String, image: String) {
        self.id = UUID()
        self.title = title
        self.image = image
    }
}


struct PremiumPurchaseView: View {
    
    init() {
        UIPageControl.appearance().currentPageIndicatorTintColor = UIColor(Color.gray5)
        UIPageControl.appearance().pageIndicatorTintColor = UIColor(Color.gray6)
    }
    
    let featureItems = [
        PremiumFeatureItem(title: "Free Delivery on All Orders", image: "truck.box.fill"),
        PremiumFeatureItem(title: "Free Shipping on All Orders", image: "truck.box.fill"),
        PremiumFeatureItem(title: "Early Access to Deals", image: "sparkles"),
        PremiumFeatureItem(title: "Priority Support", image: "clock.badge.checkmark.fill")
    ]
    
    @State var selectedOptionIndex = 0
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                TabView {
                    ForEach(featureItems) { item in
                        VStack(spacing: 8) {
                            Image(systemName: item.image)
                                .font(.system(size: 50))
                                .foregroundStyle(Color.tintLight)
                            Text(item.title)
                                .font(.system(size: 20, weight: .semibold))
                                .foregroundStyle(Color.gray2)
                        }
                        .padding(.bottom, 38)
                    }
                }
                .frame(height: 130)
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                .padding(.top, 15)
                
                VStack(spacing: 10) {
                    ForEach(featureItems) { item in
                        HStack(spacing: 10) {
                            Image(systemName: "checkmark.circle.fill")
                                .font(.system(size: 19))
                            Text(item.title)
                                .font(.system(size: 17, weight: .medium))
                            Spacer()
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(20)
                .foregroundStyle(Color.gray2)
                .background(Color.gray8)
                .clipShape(RoundedRectangle(cornerRadius: 15))
                .padding(.top, 4)
                
                HStack(spacing: 12) {
                    ZStack(alignment: .top) {
                        VStack(spacing: 4) {
                            Text("Pay Yearly")
                                .font(.system(size: 16, weight: .medium))
                            Text("$9.99/mo")
                                .font(.system(size: 26, weight: .bold))
                            Text("$119.88/year")
                                .font(.system(size: 14, weight: .medium))
                                .foregroundStyle(Color.gray3)
                        }
                        .frame(maxWidth: .infinity)
                        .frame(height: 150)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .overlay {
                            RoundedRectangle(cornerRadius: 20)
                                .strokeBorder(selectedOptionIndex == 0 ? Color.tint : Color.gray6, lineWidth: selectedOptionIndex == 0 ? 3 : 2)
                        }
                        .onTapGesture {
                            selectedOptionIndex = 0
                        }
                        
                        if selectedOptionIndex == 0 {
                            HStack {
                                Text("Save $60")
                                    .font(.system(size: 16, weight: .semibold))
                                    .foregroundStyle(.white)
                            }
                            .padding(.vertical, 4)
                            .padding(.horizontal, 12)
                            .background(Color.tint)
                            .clipShape(.capsule)
                            .padding(.top, -12)
                        }
                    }
                    
                    VStack(spacing: 4) {
                        Text("Pay Monthly")
                            .font(.system(size: 16, weight: .medium))
                        Text("$14.99/mo")
                            .font(.system(size: 26, weight: .bold))
                        Text("$179.88/year")
                            .font(.system(size: 14, weight: .medium))
                            .foregroundStyle(Color.gray3)
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 150)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .overlay {
                        RoundedRectangle(cornerRadius: 20)
                            .strokeBorder(selectedOptionIndex == 1 ? Color.tint : Color.gray6, lineWidth: selectedOptionIndex == 1 ? 3 : 2)
                    }
                    .onTapGesture {
                        selectedOptionIndex = 1
                    }
                }
                .padding(.top, 30)
            }
        }
        .padding(.horizontal, 20)
        .safeAreaInset(edge: .bottom, content: {
            VStack(spacing: 11) {
                Text("All plans include a 7-day free trail.\nYour subscription renews automatically unless it is canceled at least 24 hours before the end of the period.")
                    .font(.system(size: 14))
                    .foregroundStyle(Color.gray3)
                    .multilineTextAlignment(.center)
                Button {
                    
                } label: {
                    Text("Start free trail")
                        .font(.system(size: 21, weight: .semibold))
                        .foregroundStyle(.white)
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 16)
                .background(Color.tint)
                .clipShape(RoundedRectangle(cornerRadius: 13))
                
                Button {
                    
                } label: {
                    Text("Restore Purchases")
                        .font(.system(size: 16, weight: .medium))
                        .foregroundStyle(Color.gray2)
                }
                .padding(.top, 10)
                
                HStack(spacing: 14) {
                    Button {
                        
                    } label: {
                        Text("Terms of Service")
                            .font(.system(size: 13, weight: .medium))
                    }
                    Button {
                        
                    } label: {
                        Text("Privacy Policy")
                            .font(.system(size: 13, weight: .medium))
                    }
                }
                .foregroundStyle(Color.gray3)
            }
            .padding(.vertical, 5)
            .padding(.horizontal, 28)
            .background(.white)
        })
        .foregroundStyle(Color.gray1)
        .navigationTitle("Premium")
        .navigationBarTitleDisplayMode(.inline)
        .toolbarVisibility(.hidden, for: .tabBar)
    }
}

#Preview {
    PremiumPurchaseView()
}
