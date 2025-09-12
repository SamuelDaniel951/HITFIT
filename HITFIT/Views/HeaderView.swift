//
//  HeaderView.swift
//  HITFIT
//
//  Created by Owner on 8/30/25.
//

import SwiftUI

struct HeaderView: View {
    let exerciseName: String
    var body: some View {
        VStack {
            Text(exerciseName)
                .font(.largeTitle)
            HStack {
                Image(systemName: "1.circle")
                Image(systemName: "2.circle")
                Image(systemName: "3.circle")
                Image(systemName: "4.circle")
            }
            .font(.title2)
        }
    }
}
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }


#Preview(traits: .sizeThatFitsLayout) {
    HeaderView(exerciseName: "Squat")
}
