//
//  View.swift
//  VerticalCustomList
//
//  Created by Ayaal Ivanov on 06.03.2024.
//

import SwiftUI

extension View {

    public func addBorder<S>(_ content: S, width: CGFloat = 1, cornerRadius: CGFloat) -> some View where S : ShapeStyle {
        let roundedRect = RoundedRectangle(cornerRadius: cornerRadius)
        return clipShape(roundedRect)
             .overlay(roundedRect.strokeBorder(content, lineWidth: width))
    }
}
