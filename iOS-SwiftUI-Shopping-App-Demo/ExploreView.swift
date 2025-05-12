//
//  ExploreView.swift
//  iOS-SwiftUI-Shopping-App-Demo
//
//  Created by Modi (Victor) Li.
//

import SwiftUI

struct ExploreView: View {
    
    let topTabs = ["Home", "New", "Featured", "Deals"]
    
    @State var selectedTopTabIndex = 0
    
    @State var selectedCategoryTabIndex = 0
    
    @State var searchText: String = ""
    
    @State private var selectedProduct = Product()
    @State private var productDetailsViewIsPresented = false
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                VStack {
                    Color.white
                    Color.gray8
                }
                
                VStack(spacing: 0) {
                    
                    HStack(spacing: 16) {
                        ForEach(0 ..< topTabs.count, id: \.self) { index in
                            let isSelected = selectedTopTabIndex == index
                            VStack(spacing: 3) {
                                Text(topTabs[index])
                                    .font(.system(size: 20, weight: .semibold))
                                    .foregroundStyle(isSelected ? Color.tint : Color.gray1)
                                RoundedRectangle(cornerRadius: 2)
                                    .frame(width: 36, height: 4)
                                    .foregroundStyle(isSelected ? Color.tint : Color.clear)
                                    .animation(.spring(response: 0.2), value: isSelected)
                            }
                            .onTapGesture {
                                withAnimation {
                                    selectedTopTabIndex = index
                                }
                            }
                        }
                        Spacer()
                    }
                    .padding(.top, 10)
                    .padding(.horizontal, 14)
                    .background(.white)
                    
                    TabView(selection: $selectedTopTabIndex) {
                        
                        VStack(spacing: 0) {
                            HStack {
                                TextField("Search", text: $searchText)
                                    .font(.system(size: 18, weight: .medium))
                                    .padding(.top, 0.5)
                                Button {
                                    
                                } label: {
                                    Image(systemName: "magnifyingglass")
                                        .font(.system(size: 20, weight: .medium))
                                        .foregroundStyle(Color.gray4)
                                }
                            }
                            .padding(.vertical, 11)
                            .padding(.horizontal, 18)
                            .background(Color.gray7)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                            .padding(.top, 10)
                            .padding(.horizontal, 13)
                            
                            let homeCategorieNames = DemoData.homeProducts.map{ $0.name }
                            
                            ScrollView(.horizontal) {
                                HStack(spacing: 6) {
                                    ForEach(0 ..< homeCategorieNames.count, id: \.self) { index in
                                        let isSelected = selectedCategoryTabIndex == index
                                        ZStack(alignment: .bottomLeading) {
                                            RoundedRectangle(cornerRadius: 7)
                                                .frame(width: 30, height: 14)
                                                .padding(.leading, -5)
                                                .padding(.bottom, -3)
                                                .foregroundStyle(isSelected ? LinearGradient(gradient:Gradient(colors: [Color.tintLight.opacity(0.6),Color.tintLight.opacity(0.1)]),startPoint: .bottomLeading,endPoint: .topTrailing) : LinearGradient(gradient: Gradient(colors: [.clear]), startPoint: .bottomLeading, endPoint: .topTrailing))
                                                .animation(.spring(response: 0.2), value: isSelected)
                                            Text(homeCategorieNames[index])
                                                .font(.system(size: 18, weight: .medium))
                                                .foregroundStyle(isSelected ? Color.gray1 : Color.gray4)
                                        }
                                        .padding(.top, 5)
                                        .padding(.horizontal, 8)
                                        .padding(.bottom, 7)
                                        .background(Color.white)
                                        .onTapGesture {
                                            withAnimation(.spring(response: 0.2)) {
                                                selectedCategoryTabIndex = index
                                            }
                                        }
                                    }
                                }
                            }
                            .contentMargins(.horizontal, 9)
                            .scrollIndicators(.hidden)
                            .padding(.top, 8)
                            .background(.white)
                            
                            TabView(selection: $selectedCategoryTabIndex) {
                                
                                ForEach(0 ..< homeCategorieNames.count, id: \.self) { index in
                                    ScrollView {
                                        let products = DemoData.homeProducts[index].products
                                        
                                        if products["Featured"]!.count > 0 && products["All"]!.count > 0 {
                                            
                                            VStack(spacing: 0) {
                                                HStack {
                                                    Text("Featured")
                                                        .font(.system(size: 21, weight: .semibold))
                                                    Spacer()
                                                }
                                                .padding(.top, 9)
                                                .padding(.horizontal, 14)
                                                .background(.white)
                                                
                                                let featuredProducts = products["Featured"]!
                                                
                                                ScrollView(.horizontal) {
                                                    HStack(alignment: .top, spacing: 9) {
                                                        ForEach(featuredProducts) { product in
                                                            ProductHorizontalCardView(product: product, selectedProduct: $selectedProduct, productDetailsViewIsPresented: $productDetailsViewIsPresented)
                                                        }
                                                    }
                                                }
                                                .padding(.top, 4)
                                                .contentMargins(.horizontal, 14)
                                                .scrollIndicators(.hidden)
                                                .background(.white)
                                                
                                                if index == 0 {
                                                    PromotionBadgeView()
                                                        .padding(.bottom, 6)
                                                        .background(.white)
                                                }
                                                
                                                if index != 0 {
                                                    HStack {
                                                        Text("All")
                                                            .font(.system(size: 21, weight: .semibold))
                                                        Spacer()
                                                    }
                                                    .padding(.top, 5)
                                                    .padding(.horizontal, 14)
                                                    .background(.white)
                                                }
                                                
                                                let allProducts = products["All"]!
                                                
                                                HStack(spacing: 8) {
                                                    VStack {
                                                        if index == 0 {
                                                            PromotionCardView()
                                                        }
                                                        
                                                        ForEach(Array(stride(from: 0, to: allProducts.count, by: 2)), id: \.self) { index in
                                                            ProductVerticalCardView(geometry: geometry, product: allProducts[index], selectedProduct: $selectedProduct, productDetailsViewIsPresented: $productDetailsViewIsPresented)
                                                        }
                                                    }
                                                    .frame(maxHeight: .infinity, alignment: .top)
                                                    
                                                    VStack {
                                                        ForEach(Array(stride(from: 1, to: allProducts.count, by: 2)), id: \.self) { index in
                                                            ProductVerticalCardView(geometry: geometry, product: allProducts[index], selectedProduct: $selectedProduct, productDetailsViewIsPresented: $productDetailsViewIsPresented)
                                                        }
                                                    }
                                                    .frame(maxHeight: .infinity, alignment: .top)
                                                }
                                                .padding(.top, 4)
                                                .padding(.horizontal, 10)
                                                .padding(.bottom, 25)
                                                .background(
                                                    VStack(spacing: 0) {
                                                        LinearGradient(gradient: Gradient(colors: [Color.white, Color.gray8]), startPoint: .top, endPoint: .bottom)
                                                            .frame(height: 400)
                                                        Color.gray8
                                                    }
                                                )
                                            }
                                        }
                                    }
                                    .tag(index)
                                }
                            }
                            .tabViewStyle(.page(indexDisplayMode: .never))
                            .animation(.easeInOut, value: selectedCategoryTabIndex)
                        }
                        .tag(0)
                        
                        ForEach(1 ..< topTabs.count, id: \.self) { index in
                            VStack {
                                Text("Coming Soon ...")
                            }
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .background(.white)
                            .tag(index)
                        }
                    }
                    .tabViewStyle(.page(indexDisplayMode: .never))
                    .animation(.easeInOut, value: selectedTopTabIndex)
                }
                .foregroundStyle(Color.gray1)
                
                if productDetailsViewIsPresented {
                    ProductDetailsView(isPresented: $productDetailsViewIsPresented, product: $selectedProduct)
                        .transition(.move(edge: .trailing))
                        .zIndex(1)
                        .toolbarVisibility(.hidden, for: .tabBar)
                }
            }
        }
    }
}

struct ProductHorizontalCardView: View {
    
    let product: Product
    
    @Binding var selectedProduct: Product
    
    @Binding var productDetailsViewIsPresented: Bool
    
    var body: some View {
        VStack(spacing: 0) {
            RoundedRectangle(cornerRadius: 7)
                .frame(width: 160, height: 160)
                .foregroundStyle(product.backgroundColor)
            
            VStack(alignment: .leading, spacing: 1) {
                HStack {
                    Text(product.title)
                        .font(.system(size: 17, weight: .medium))
                        .fixedSize(horizontal: false, vertical: true)
                        .lineLimit(2)
                        .truncationMode(.tail)
                        .multilineTextAlignment(.leading)
                    Spacer()
                }
                
                HStack(alignment: .bottom, spacing: 0) {
                    Text("$")
                        .font(.system(size: 15, weight: .semibold))
                        .padding(.bottom, 1.7)
                    Text(product.priceSplittedStrings.0)
                        .font(.system(size: 20, weight: .semibold))
                    Text(product.priceSplittedStrings.1)
                        .font(.system(size: 15, weight: .semibold))
                        .padding(.bottom, 1.4)
                }
                .foregroundStyle(Color.tint)
            }
            .padding(.top, 7)
            .padding(.leading, 4)
            .padding(.bottom, 8)
        }
        .frame(width: 160)
        .foregroundStyle(Color.gray1)
        .onTapGesture {
            withAnimation(.easeInOut) {
                selectedProduct = product
                productDetailsViewIsPresented = true
            }
        }
    }
}

struct PromotionBadgeView: View {
    var body: some View {
        VStack(spacing: 4) {
            Text("Flash Deals")
                .font(.system(size: 25, weight: .semibold))
            Text("Up to 80% off")
                .font(.system(size: 17, weight: .medium))
            
            Button {
                
            } label: {
                Text("Shop now")
                    .font(.system(size: 17, weight: .semibold))
                    .foregroundStyle(Color.gray2)
            }
            .padding(.vertical, 10)
            .padding(.horizontal, 20)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .padding(.top, 14)
        }
        .frame(maxWidth: .infinity)
        .multilineTextAlignment(.center)
        .padding(.top, 26)
        .padding(.horizontal, 23)
        .padding(.bottom, 20)
        .foregroundStyle(Color.gray1)
        .background(Color.fromRGB(red: 230, green: 248, blue: 239))
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .padding(.horizontal, 10)
    }
}

struct ProductVerticalCardView: View {
    
    let geometry: GeometryProxy
    
    let product: Product
    
    @Binding var selectedProduct: Product
    
    @Binding var productDetailsViewIsPresented: Bool
    
    var body: some View {
        VStack(spacing: 1) {
            Rectangle()
                .frame(width: (geometry.size.width - 28) / 2, height: (geometry.size.width - 28) / 2)
                .clipShape(
                    .rect(
                        topLeadingRadius: 8,
                        bottomLeadingRadius: 0,
                        bottomTrailingRadius: 0,
                        topTrailingRadius: 8
                    )
                )
                .foregroundStyle(product.backgroundColor)
            
            VStack(alignment: .leading, spacing: 2) {
                HStack {
                    Text(product.title)
                        .font(.system(size: 17, weight: .medium))
                        .fixedSize(horizontal: false, vertical: true)
                        .lineLimit(3)
                        .truncationMode(.tail)
                        .multilineTextAlignment(.leading)
                    Spacer()
                }
                
                HStack(alignment: .bottom, spacing: 0) {
                    Text("$")
                        .font(.system(size: 15, weight: .semibold))
                        .padding(.bottom, 1.7)
                    Text(product.priceSplittedStrings.0)
                        .font(.system(size: 20, weight: .semibold))
                    Text(product.priceSplittedStrings.1)
                        .font(.system(size: 15, weight: .semibold))
                        .padding(.bottom, 1.4)
                }
                .foregroundStyle(Color.tint)
            }
            .padding(.top, 8)
            .padding(.horizontal, 12)
            .padding(.bottom, 3)
        }
        .frame(maxWidth: .infinity)
        .padding(.bottom, 6)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .foregroundStyle(Color.gray1)
        .onTapGesture {
            withAnimation(.easeInOut) {
                selectedProduct = product
                productDetailsViewIsPresented = true
            }
        }
    }
}

struct PromotionCardView: View {
    
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: "checkmark.shield")
                .font(.system(size: 31, weight: .medium))
            Text("Low Price Guaranteed")
                .font(.system(size: 16, weight: .medium))
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color.fromRGB(red: 226, green: 240, blue: 253))
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .multilineTextAlignment(.center)
        .foregroundStyle(Color.gray1)
    }
}

#Preview {
    ExploreView()
}
