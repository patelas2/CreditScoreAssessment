//
//  AnimatingNumberOverlay.swift
//  
//
//  Created by Ashish Patel on 12/27/22.
//

import SwiftUI

/// Animated modifier
struct AnimatingNumberOverlay: AnimatableModifier {
    var number: CGFloat
    var animatableData: CGFloat {
        get { number }
        set { number = newValue }
    }
    
    func body(content: Content) -> some View {
        return content.overlay(
            Text("\(Int(number))")
                .textDefaultSettings(size: .extraXXLargeFont, weight: .light, color: .primaryColor))
    }
}
