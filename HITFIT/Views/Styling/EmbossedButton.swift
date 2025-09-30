//
//  EmbossedButton.swift
//  HITFIT
//

import SwiftUI

struct EmbossedButtonStyle: ButtonStyle {
    enum EmbossedButtonShape {
        case circle, capsule
    }

    // Default shape
    var buttonShape: EmbossedButtonShape = .capsule

    func makeBody(configuration: Configuration) -> some View {
        let shadow = Color.dropShadow
        let highlight = Color.dropHighlight

        return configuration.label
            .padding(10)
            .background(
                GeometryReader { geometry in
                    shape(size: geometry.size)                 // shape embedded in GeometryReader
                        .foregroundStyle(Color.background)
                        .shadow(color: shadow, radius: 1, x: 2, y: 2)
                        .shadow(color: highlight, radius: 1, x: -2, y: -2)
                        .offset(x: -1, y: -1)
                }
            )
    }

    // Returns a stroked, sized shape based on buttonShape
    @ViewBuilder
    func shape(size: CGSize) -> some View {
        switch buttonShape {
        case .circle:
            Circle()
                .stroke(Color.background, lineWidth: 2)
                .frame(
                width: max(size.width, size.height),
                height: max(size.width, size.height))
                .offset(x: -1)
                .offset(y: -max(size.width, size.height) / 2 +
                min(size.width, size.height) / 2)
        case .capsule:
            Capsule()
                .stroke(Color.background, lineWidth: 2)
                .frame(width: size.width, height: size.height)
        
        }
        
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    Button("History") {}
        .fontWeight(.bold)
        .buttonStyle(EmbossedButtonStyle(buttonShape: .circle))
        .padding(40)
}
