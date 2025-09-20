//
//  WelcomeView.swift
//  HITFIT
//
//  Created by Owner on 8/30/25.
//

import SwiftUI

struct WelcomeView: View {
    @State private var showHistory = false
    @Binding var selectedTab: Int
    var body: some View {
        ZStack {
            VStack {
                HStack (alignment: .bottom) {
                    VStack(alignment: .leading) {
                        Text("Get fit")
                            .font(.largeTitle)
                        Text("with high intensity interval training")
                            .font(.headline)
                    }
                    Image("step-up.png")
                        .resizable()
//                        .aspectRatio(contentMode: .fill)
//                        .frame(width: 240.0, height: 240.0)
//                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        .resizedToFill(width: 240, height: 240)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    
                }
            }
            VStack {
                HeaderView(selectedTab: $selectedTab, titleText: "Welcome")
                Spacer()
                
                Button(action: { selectedTab = 0 }) {                Text("Get Started")
                Image(systemName: "arrow.right.circle")
                    
                }
                .font(.title2)
                .padding()
                .background(
                RoundedRectangle(cornerRadius: 20)
                .stroke(Color.gray, lineWidth: 2))
                Button("History") {
                showHistory.toggle()
                }
                .sheet(isPresented: $showHistory) {
                HistoryView(showHistory: $showHistory)
                }
            }
        }
    }
}

#Preview {
    WelcomeView(selectedTab: .constant(9))
}
