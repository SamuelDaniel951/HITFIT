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

// 3. The RaisedButton view (now takes text + action closure)
struct RaisedButton: View {
    let buttonText: String
    let action: () -> Void
    
    var body: some View {
        Button(action: {
            action()
        }, label: {
            Text(buttonText)
                .raisedButtonTextStyle()
        })
        .buttonStyle(.raised)
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
        RaisedButton(buttonText: "Get Started") {
            print("Hello World")
        }
        .padding(20)
    }
    .background(Color.background)
}
