//
//  Styles.swift
//  FoodFinder_V1.0
//
//  Created by Casey Traina on 5/26/22.
//

import Foundation
import SwiftUI

struct customViewModifier: ViewModifier {
    var roundedCornes: CGFloat
    var startColor: Color
    var endColor: Color
    var textColor: Color
    
    func body(content: Content) -> some View {
        content
            .padding()
            .background(LinearGradient(gradient: Gradient(colors: [startColor, endColor]), startPoint: .topLeading, endPoint: .bottomTrailing))
            .cornerRadius(roundedCornes)
            .padding(3)
            .foregroundColor(textColor)
            .overlay(RoundedRectangle(cornerRadius: roundedCornes)
                        .stroke(LinearGradient(gradient: Gradient(colors: [startColor, endColor]), startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 2.5))
            .font(.custom("Open Sans", size: 18))
            
            .shadow(radius: 10)
    }
}

struct MainLabelStyle: LabelStyle {
    var textSize: CGFloat
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.icon
            configuration.title
                .font(.custom("Avenir Next", size: textSize))
                .padding(.horizontal)
        }
        .padding(.horizontal)
        // Your custom code here

    }
}


struct DarkBlueShadowProgressViewStyle: ProgressViewStyle {
    func makeBody(configuration: Configuration) -> some View {
        ProgressView(configuration)
            .shadow(color: Color(red: 0, green: 0, blue: 0.6),
                    radius: 4.0, x: 1.0, y: 2.0)
    }
}
