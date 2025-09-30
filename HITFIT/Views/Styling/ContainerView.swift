//
//  ContainerView.swift
//  HITFIT
//

import SwiftUI

struct ContainerView<Content: View>: View {
    // store the view content
    let content: Content

    // initializer
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    // body uses the stored content
    var body: some View {
    ZStack {
        RoundedRectangle(cornerRadius: 25.0)
            .foregroundStyle(Color.background)
    VStack {
        Spacer()
    Rectangle()
        .frame(height: 25)
        .foregroundStyle(Color.background)
        }
        content
        }
        }
}

#Preview(traits: .sizeThatFitsLayout) {
    ContainerView {
        VStack {
            RaisedButton(buttonText: "Hello World") {}
                .padding(50)
            Button("Tap me!") {}
                .buttonStyle(EmbossedButtonStyle(buttonShape: .circle))
        }
    }
    .padding(50)
}
