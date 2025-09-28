//
//  RatingView.swift
//  HITFIT
//
//  Created by Owner on 8/31/25.
//

import SwiftUI

struct RatingView: View {
    // MARK: - Properties
    let exerciseIndex: Int
    @AppStorage("ratings") private var ratings = ""
    @State private var rating = 0   // 1

    let maximumRating = 5           // 2
    let onColor = Color.red         // 3
    let offColor = Color.gray

    // MARK: - Initializer
    init(exerciseIndex: Int) {
        self.exerciseIndex = exerciseIndex
        // 2
        let desiredLength = Exercise.exercises.count
        if ratings.count < desiredLength {
            // 3
            ratings = ratings.padding(
                toLength: desiredLength,
                withPad: "0",
                startingAt: 0
            )
        }
    }

    // MARK: - Methods
    func updateRating(index: Int) {
        rating = index
        let index = ratings.index(
            ratings.startIndex,
            offsetBy: exerciseIndex
        )
        ratings.replaceSubrange(index...index, with: String(rating))
    }

    // MARK: - Body
    fileprivate func convertRating() {
        // 1
        // 2
        let index = ratings.index(
            ratings.startIndex,
            offsetBy: exerciseIndex
        )
        // 3
        let character = ratings[index]
        // 4
        rating = character.wholeNumberValue ?? 0
    }
    
    var body: some View {
        HStack {
            ForEach(1 ..< maximumRating + 1, id: \.self) { index in
                Image(systemName: "waveform.path.ecg")
                    .foregroundColor(index > rating ? offColor : onColor) // 4
                    .font(.largeTitle)
                    .onTapGesture {                                     // 5
                        updateRating(index: index)
                    }
                    .onChange(of: ratings) {
                    convertRating()
                    }
                    .onAppear {                                          convertRating()
                    }
            }
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    RatingView(exerciseIndex: 0)
}
