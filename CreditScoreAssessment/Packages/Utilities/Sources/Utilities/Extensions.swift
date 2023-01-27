//
//  Extensions.swift
//  
//
//  Created by Ashish Patel on 12/26/22.
//

import Foundation
import SwiftUI

/// String extension
public extension String {
    func localized (bundle: Bundle = .main, tableName: String = "Localizable") -> String {
        return NSLocalizedString(self, tableName: tableName, value: "\(self)", comment: "")
    }
    
    func localizedWith(_ params: CVarArg...) -> String {
        return String(format: localized(), arguments: params)
    }
}

/// Text extension
public extension Text {
    func textDefaultSettings(size: AppFontSize = .regularFont,
                             weight: Font.Weight = .regular,
                             color: Color = .blackColor,
                             padding: CGFloat = 0) -> some View {
        self.font(.custom("HelveticaNeue",
                          size: size.rawValue,
                          relativeTo: .headline)
            .weight(weight)).foregroundColor(color)
            .padding(padding)
    }
}

public extension VStack {
    func setBackgroundProperties() -> some View {
        self.padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(
                Color.secondaryColor.opacity(0.5)
                    .cornerRadius(10)
                    .shadow(
                        color: Color.secondaryColor.opacity(0.5),
                        radius: 10,
                        x: 0.0, y: 10)
            )
            .padding(10)
            .padding(.horizontal, 10)
    }
}

/// Color extension
public extension Color {
    static let primaryColor = Color("primaryColor")
    static let secondaryColor = Color("secondaryColor")
    static let blackColor = Color("creditScoreContainerCircleBorder")
}

/// Font size extension
public enum AppFontSize: CGFloat {
    case extraXXLargeFont = 70
    case extraLargeFont = 30
    case largeFont = 20
    case regularFont = 14
}
