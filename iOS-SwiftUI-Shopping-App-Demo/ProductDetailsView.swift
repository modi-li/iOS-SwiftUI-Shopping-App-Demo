//
//  ProductDetailsView.swift
//  iOS-SwiftUI-Shopping-App-Demo
//
//  Created by Modi (Victor) Li.
//

import SwiftUI

struct ProductDetailsView: View {
    
    @Binding var isPresented: Bool
    @Binding var product: Product
    
    @State var scrollViewIsDisabled = false
    
    @State var xOffset: CGFloat = 0
    @State var yOffset: CGFloat = 0
    let dismissThreshold: CGFloat = 300
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color.white
                    .ignoresSafeArea()
                
                VStack {
                    ScrollView {
                        VStack(spacing: 0) {
                            Rectangle()
                                .frame(width: geometry.size.width, height: geometry.size.width)
                                .foregroundStyle(product.backgroundColor)
                            
                            HStack {
                                Text(product.title)
                                    .font(.system(size: 24, weight: .medium))
                                    .multilineTextAlignment(.leading)
                                Spacer()
                            }
                            .padding(.top, 15)
                            .padding(.horizontal, 16)
                            
                            HStack(alignment: .bottom, spacing: 0) {
                                Text("$\(product.priceDisplay)")
                                    .font(.system(size: 23, weight: .semibold))
                                Spacer()
                            }
                            .padding(.top, 7)
                            .padding(.horizontal, 16)
                            .foregroundStyle(Color.tint)
                            
                            HStack {
                                Text("Description")
                                    .font(.system(size: 19, weight: .medium))
                                    .foregroundStyle(Color.gray2)
                                Spacer()
                            }
                            .padding(.top, 20)
                            .padding(.horizontal, 16)
                            
                            Text(DemoData.description)
                                .font(.system(size: 17))
                                .foregroundStyle(Color.gray2)
                                .multilineTextAlignment(.leading)
                                .padding(.top, 4)
                                .padding(.horizontal, 16)
                        }
                    }
                    .contentMargins(.bottom, 20)
                    .disabled(scrollViewIsDisabled)
                }
                
                VStack {
                    HStack {
                        Button {
                            withAnimation(.easeInOut) {
                                isPresented = false
                            }
                        } label: {
                            Image(systemName: "chevron.backward")
                                .font(.system(size: 16, weight: .semibold))
                                .foregroundStyle(Color.gray3)
                        }
                        .padding(14)
                        .background(.white)
                        .clipShape(.circle)
                        .shadow(color: .gray.opacity(0.1), radius: 4)
                        
                        Spacer()
                    }
                    .padding(.vertical, 8)
                    .padding(.horizontal, 15)
                    
                    Spacer()
                }
            }
            .foregroundStyle(Color.gray1)
            .safeAreaInset(edge: .bottom) {
                HStack(spacing: 26) {
                    HStack(spacing: 16) {
                        Button {
                        } label: {
                            VStack(spacing: 1) {
                                Image(systemName: "bag")
                                    .font(.system(size: 23))
                                Text("Bag")
                                    .font(.system(size: 13, weight: .medium))
                            }
                        }
                    }
                    .padding(.bottom, 2)
                    .foregroundStyle(Color.gray2)
                    
                    HStack(spacing: 0) {
                        Button {
                        } label: {
                            Text("Add to Cart")
                                .font(.system(size: 17, weight: .semibold))
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 14)
                        .foregroundStyle(.white)
                        .background(Color.fromRGB(red: 24, green: 77, blue: 119))
                        .clipShape(
                            .rect(topLeadingRadius: 12, bottomLeadingRadius: 12, bottomTrailingRadius: 0, topTrailingRadius: 0)
                        )
                        
                        Button {
                        } label: {
                            Text("Buy Now")
                                .font(.system(size: 17, weight: .semibold))
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 14)
                        .foregroundStyle(.white)
                        .background(Color.fromRGB(red: 102, green: 144, blue: 238))
                        .clipShape(
                            .rect(topLeadingRadius: 0, bottomLeadingRadius: 0, bottomTrailingRadius: 12, topTrailingRadius: 12)
                        )
                    }
                }
                .padding(.top, 12)
                .padding(.horizontal, 28)
                .padding(.bottom, geometry.safeAreaInsets.bottom + 3)
                .background(.white)
                .shadow(color: .gray.opacity(0.15), radius: 5)
            }
            .clipShape(
                yOffset > 0 ? .rect(topLeadingRadius: 40, bottomLeadingRadius: 0, bottomTrailingRadius: 0, topTrailingRadius: 40) : .rect(topLeadingRadius: 0, bottomLeadingRadius: 0, bottomTrailingRadius: 0, topTrailingRadius: 0)
            )
            .frame(height: geometry.size.height + geometry.safeAreaInsets.bottom)
            .shadow(color: yOffset > 0 ? .gray.opacity(0.2) : .clear, radius: 6)
            .offset(x: xOffset, y: yOffset)
            .gesture(
                DragGesture()
                    .onChanged({ value in
                        scrollViewIsDisabled = true
                        
                        let xTranslation = value.translation.width
                        if xTranslation > 0 {
                            withAnimation(.easeInOut) {
                                xOffset = xTranslation
                            }
                        }
                        
                        let yTranslation = value.translation.height
                        if yTranslation > 0 {
                            withAnimation(.easeInOut) {
                                yOffset = yTranslation
                            }
                        }
                    })
                    .onEnded({ value in
                        scrollViewIsDisabled = false
                        
                        if value.translation.width > dismissThreshold || value.translation.height > dismissThreshold {
                            withAnimation(.easeInOut) {
                                xOffset = UIScreen.main.bounds.width
                                yOffset = UIScreen.main.bounds.height
                                isPresented = false
                            }
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                xOffset = 0
                                yOffset = 0
                            }
                        } else {
                            withAnimation(.easeInOut) {
                                xOffset = 0
                                yOffset = 0
                            }
                        }
                    })
            )
        }
    }
}

#Preview {
    @Previewable @State var isPresented = true
    @Previewable @State var product = DemoData.homeProducts[0].products["Featured"]![0]
    ProductDetailsView(isPresented: $isPresented, product: $product)
}
