//
//  ContentView.swift
//  HITFIT
//
//  Created by Owner on 8/30/25.
//

import SwiftUI

struct ContentView: View {
    @SceneStorage("selectedTab") private var selectedTab = 9
    
    var body: some View {
    TabView(selection: $selectedTab) {
    WelcomeView(selectedTab: $selectedTab) // 1
    .tag(9) // 2
    ForEach(Exercise.exercises.indices, id: \.self) { index in
    ExerciseView(selectedTab: $selectedTab, index: index)
    .tag(index) // 3
    }
    }
    .environmentObject(HistoryStore())
    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
    .onAppear {
    print(URL.documentsDirectory)
    }
    }
        }
       
    


struct ContentView_Previews: PreviewProvider {
static var previews: some View {
ContentView()
}
}
