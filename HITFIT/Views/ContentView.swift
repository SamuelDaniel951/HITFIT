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
                    Text("Welcome")
                     Text("Exercise 1")
                     Text("Exercise 2")
            
                    
                }
                .tabViewStyle(PageTabViewStyle())
                    .indexViewStyle(
                        PageIndexViewStyle(backgroundDisplayMode: .always))
            }
        }
       
    }
}

#Preview {
    ContentView()
}
