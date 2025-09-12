//
//  HistoryView.swift
//  HITFIT
//
//  Created by Owner on 9/5/25.
//

import SwiftUI

struct HistoryView: View {
    let history = HistoryStore()

    var body: some View {
        VStack {
            Text("History")
                .font(.title)
                .padding()

            Form {
                ForEach(history.exerciseDays) { day in
                    Section(
                        header:
                            Text(day.date.formatted(as: "MMM d"))
                                .font(.headline)
                    ) {
                        ForEach(day.exercises, id: \.self) { exercise in
                            Text(exercise)
                        }
                    }
                }
            }
        }
    }
}

#Preview { HistoryView() }


