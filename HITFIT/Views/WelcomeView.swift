//
//  WelcomeView.swift
//  HITFIT
//
//  Created by Owner on 8/30/25.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    VStack(alignment: .leading) {
                        Text("Get fit")
                            .font(.largeTitle)
                        Text("with high intensity interval training")
                            .font(.headline)
                    }
                    
                }
            }
            VStack {
                HeaderView(titleText: "Welcome")
                Spacer()
                Button("History") { }
                  .padding(.bottom)
            }
        }
    }
}

#Preview {
    WelcomeView()
}
