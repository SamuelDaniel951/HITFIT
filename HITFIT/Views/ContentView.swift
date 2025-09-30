//
//  ContentView.swift
//  HITFIT
//

import SwiftUI

struct ContentView: View {
    @SceneStorage("selectedTab") private var selectedTab = 9

    var body: some View {
        ZStack {
            GradientBackground()   // stays behind all pages

            TabView(selection: $selectedTab) {
                WelcomeView(selectedTab: $selectedTab)
                    .tag(9)
                    .background(.clear)

                ForEach(Exercise.exercises.indices, id: \.self) { index in
                    ExerciseView(selectedTab: $selectedTab, index: index)
                        .tag(index)
                        .background(.clear)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        }
        .onAppear {
            print(URL.documentsDirectory)
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(HistoryStore())
}
