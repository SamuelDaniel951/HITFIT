//
//  ContentView.swift
//  HITFIT
//
//  Created by Owner on 8/30/25.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            TabView {
                TabView {
                  WelcomeView()   // was Text("Welcome")
                    ForEach(Exercise.exercises.indices, id: \.self) { index in
                      ExerciseView(index: index)
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            }
        }
       
    }
}

#Preview {
    ContentView()
}
