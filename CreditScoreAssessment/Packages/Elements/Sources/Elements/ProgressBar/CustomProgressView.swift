//
//  CustomProgressView.swift
//  
//
//  Created by Ashish Patel on 12/26/22.
//

import SwiftUI
import Utilities

/// Custom progres bar
public struct CustomProgressView: View {
    
    /// Properties
    @State private var animatedProgress: CGFloat = 0
    @Binding var progress: CGFloat
   
    private let currentProgress: CGFloat
    private let maxProgress: String
    private let animationDuration = 3.0
    private let defaultSize: CGFloat = 10

    /// init
    public init(currentProgress: CGFloat,
                maxProgress: String,
                progress: Binding<CGFloat>) {
        self.currentProgress = currentProgress
        self.maxProgress = maxProgress
        self._progress = progress
    }
    
    /// Body
    public var body: some View {
        ZStack {
            /// Placeholder cirlce
            Circle()
                .foregroundColor(.secondaryColor)
                .opacity(0.5)
            
            /// Progress circle
            Circle()
                .trim(from: 0.0, to: min(progress, 1.0))
                .stroke(
                    LinearGradient(colors: [.blackColor, .blackColor.opacity(0.8)],
                                   startPoint: .topTrailing,
                                   endPoint: .bottomLeading),
                    style: StrokeStyle(lineWidth: defaultSize/2, lineCap: .round, lineJoin: .round))
                .rotationEffect(.degrees(-90))
                .shadow(radius: 5)
                .padding(.horizontal, defaultSize)
                .modifier(AnimatingNumberOverlay(number: animatedProgress))
            CustomProgressBodyView
        }
        .padding(.horizontal, defaultSize*2)
        .animation(.easeInOut(duration: animationDuration), value: progress)
        .onAppear() {
            withAnimation(.easeIn(duration: animationDuration)) {
                self.animatedProgress = currentProgress
           }
        }
    }
    
    private var CustomProgressBodyView: some View {
            VStack(spacing: defaultSize*8) {
                Text("dashboard.creditScorePresentation".localized())
                    .textDefaultSettings(size: .largeFont, weight: .regular, color: .blackColor)
                Text("dashboard.creditScoreMaximum".localizedWith(maxProgress))
                    .textDefaultSettings(size: .largeFont, weight: .regular, color: .blackColor)
                
        }
    }
}
