import SwiftUI

struct HistoryView: View {
    @Binding var showHistory: Bool
    let history = HistoryStore()

    var body: some View {
        ZStack(alignment: .topTrailing) {
            // Main content
            VStack {
                Text("History")
                    .font(.title)

                Form {
                    ForEach(history.exerciseDays) { day in
                        Section(
                            header: Text(day.date.formatted(as: "MMM d"))
                                .font(.headline)
                        ) {
                            ForEach(day.exercises, id: \.self) { exercise in
                                Text(exercise)
                            }
                        }
                    }
                }
            }

            // Top-right dismiss button (overlay)
            Button {
                showHistory.toggle()  // or showHistory = false
            } label: {
                Image(systemName: "xmark.circle.fill")
                    .font(.title)
            }
            .padding()
        }
    }
}

#Preview {
    HistoryView(showHistory: .constant(true))
}
