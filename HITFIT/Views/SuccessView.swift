import SwiftUI

struct SuccessView: View {
    @Binding var selectedTab: Int
    @Environment(\.dismiss) var dismiss
    var body: some View {
        
        ZStack {
            VStack(spacing: 12) {
            
                Image(systemName: "hand.raised.fill")
                    .symbolRenderingMode(.hierarchical)
                    .foregroundStyle(.purple)
                    .font(.system(size: 75))

                Text("High Five!")
                    .font(.largeTitle)
                    .fontWeight(.bold)

                // Text
                Text("""
                Good job completing all exercises.
                Keep up the momentum!
                Come back tomorrow for more.
                """)
                .font(.subheadline)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            }

            // Bottom button
            VStack {
                Spacer()
                Button("Continue") {
                dismiss()
                    selectedTab = 9
                }
                }
                .font(.title3)
                .padding()
                .presentationDetents([.medium, .large])
            }
        }
    }


#Preview {
    SuccessView(selectedTab: .constant(3))
}
