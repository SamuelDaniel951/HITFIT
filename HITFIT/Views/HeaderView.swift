import SwiftUI

struct HeaderView: View {
    @Binding var selectedTab: Int
    let titleText: String

    var body: some View {
        VStack {
            Text(titleText)
                .font(.largeTitle)

            HStack(spacing: 10) {                        // challenge
                ForEach(Exercise.exercises.indices, id: \.self) { index in
                    ZStack {
                        if index == selectedTab {         // challenge
                            Circle()
                                .fill(.white)
                                .opacity(0.20)
                                .frame(width: 22, height: 22)
                        }
                        Circle()                          // challenge
                            .fill(.white)
                            .opacity(index == selectedTab ? 1.0 : 0.55)
                            .frame(width: 8, height: 8)
                    }
                    .onTapGesture { selectedTab = index }
                }
            }
            .font(.title2)
        }
    }
}

#Preview {
    HeaderView(selectedTab: .constant(0), titleText: "Squat")
}
