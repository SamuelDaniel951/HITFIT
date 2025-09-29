//
//  RaisedButton.swift
//  HITFIT
//

import SwiftUI

// 1. The reusable RaisedButtonStyle
struct RaisedButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
    configuration.label
    .frame(maxWidth: .infinity)
    .padding([.top, .bottom], 12)
    .background(
    Capsule()
        .foregroundStyle(Color.background)
        .shadow(color: Color.dropShadow, radius: 4, x: 6, y: 6)
        .shadow(color: Color.dropHighlight, radius: 4, x: -6, y: -6)
    )
    }
    }


// 2. A convenience static var for .buttonStyle(.raised)
extension ButtonStyle where Self == RaisedButtonStyle {
    static var raised: RaisedButtonStyle {
        .init()
    }
}

// 3. The RaisedButton view
struct RaisedButton: View {
    var body: some View {
        Button(action: {}, label: {
            Text("Get Started")
                .raisedButtonTextStyle()   // apply the custom text style
        })
        .buttonStyle(.raised)              // apply the new button style
    }
}

// 4. Text extension for consistent text styling
extension Text {
    func raisedButtonTextStyle() -> some View {
        self
            .font(.body)
            .fontWeight(.bold)
    }
}

// 5. Preview
#Preview(traits: .sizeThatFitsLayout) {
    
    ZStack {
        RaisedButton()
            .padding(20)
    }
    .buttonStyle(.raised)
    .background(Color.background)
}
