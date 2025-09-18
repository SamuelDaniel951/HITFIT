//
//  HistoryStore.swift
//  HITFIT
//
//  Created by Owner on 9/6/25.
//
import Foundation

struct ExerciseDay: Identifiable {
  let id = UUID()
  let date: Date
  var exercises: [String] = []
}
struct HistoryStore {
    var exerciseDays: [ExerciseDay] = []
    init() {
#if DEBUG
        createDevData()
#endif
    }
}

