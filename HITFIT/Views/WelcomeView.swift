//
//  WelcomeView.swift
//  HITFIT
//

import SwiftUI

struct WelcomeView: View {
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

    // State for presenting history sheet
    @State private var showHistory = false

    // Selected tab binding from parent
    @Binding var selectedTab: Int

    // Get Started button as a reusable view
    var getStartedButton: some View {
        RaisedButton(buttonText: "Get Started") {
            selectedTab = 0
        }
        .padding()
    }

    var body: some View {
        VStack {
            HeaderView(
                selectedTab: $selectedTab,
                titleText: "Welcome"
            )
            // 20% height
            .containerRelativeFrame(.vertical) { length, _ in
                length * 0.2
            }

            // container view
            ContainerView {
                ViewThatFits {
                    VStack {
                        WelcomeView.images
                        WelcomeView.welcomeText
                        getStartedButton
                        Spacer()
                        historyButton
                    }
                    VStack {
                        WelcomeView.welcomeText
                        getStartedButton
                        Spacer()
                        historyButton
                    }
                }
            }

            // 80% height
            .containerRelativeFrame(.vertical) { length, _ in
                length * 0.8
            }
        }
        .sheet(isPresented: $showHistory) {
            HistoryView(showHistory: $showHistory)
        }
    }
}

#Preview {
    WelcomeView(selectedTab: .constant(9))
}
