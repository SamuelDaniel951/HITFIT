import SwiftUI
import AVKit

struct ExerciseView: View {
    var historyButton: some View {
        Button(
            action: { showHistory = true },
            label: {
                Text("History")
                    .fontWeight(.bold)
                    .padding([.leading, .trailing], 5)
            }
        )
        .padding(.bottom, 10)
        .buttonStyle(EmbossedButtonStyle())
    }

    @EnvironmentObject var history: HistoryStore
    @State private var showSuccess = false
    @State private var showHistory = false
    @Binding var selectedTab: Int

    var lastExercise: Bool { index + 1 == Exercise.exercises.count }

    var startButton: some View {
        RaisedButton(buttonText: "Start Exercise") {
            showTimer.toggle()
        }
    }

    var doneButton: some View {
        Button("Done") {
            history.addDoneExercise(Exercise.exercises[index].exerciseName)
            timerDone = false
            showTimer.toggle()
            if lastExercise {
                showSuccess.toggle()
            } else {
                selectedTab += 1
            }
        }
        .disabled(!timerDone)
        .sheet(isPresented: $showSuccess) {
            SuccessView(selectedTab: $selectedTab)
                .presentationDetents([.medium, .large])
        }
    }

    let index: Int
    var exercise: Exercise { Exercise.exercises[index] }

    @State private var timerDone = false
    @State private var showTimer = false

    var body: some View {
        VStack {
            HeaderView(
                selectedTab: $selectedTab,
                titleText: exercise.exerciseName
            )
            .containerRelativeFrame(.vertical) { length, _ in length * 0.20 }   // challenge

            ContainerView {                                                     // challenge
                GeometryReader { geometry in
                    VStack {
                        if let url = Bundle.main.url(forResource: exercise.videoName, withExtension: "mp4") {
                            VideoPlayer(player: AVPlayer(url: url))
                                .frame(height: geometry.size.height * 0.45)
                        } else {
                            Text("Couldn't find \(exercise.videoName).mp4")
                                .foregroundColor(.red)
                        }

                        HStack(spacing: 150) {
                            startButton
                            doneButton
                        }
                        .font(.title3)
                        .padding()

                        if showTimer {
                            TimerView(
                                timerDone: $timerDone,
                                size: geometry.size.height * 0.07
                            )
                        }

                        Spacer()

                        RatingView(exerciseIndex: index)
                            .padding()

                        historyButton
                            .sheet(isPresented: $showHistory) {
                                HistoryView(showHistory: $showHistory)
                            }
                    }
                }
            }
            .containerRelativeFrame(.vertical) { length, _ in length * 0.80 }   // challenge
        }
        .background(.clear) // keep gradient visible
    }
}

#Preview {
    ExerciseView(selectedTab: .constant(0), index: 0)
        .environmentObject(HistoryStore())
        .background(GradientBackground()) // preview-only so you see the gradient here
}
