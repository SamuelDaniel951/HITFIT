//
//  HITFITApp.swift
//  HITFIT
//
//  Created by Owner on 8/30/25.
//

import SwiftUI

@main
struct HITFITApp: App {
    @StateObject private var historyStore = HistoryStore()
    var body: some Scene {
        WindowGroup {
            ContentView()
                
                .environmentObject(historyStore)
                .alert(
                    // 1
                    "History",
                    // 2
                    isPresented: $historyStore.loadingError) {
                        // 3
                        Button("OK") { }
                    } message: {
                        // 4
                        Text(
                        """
                        Unfortunately we can't load your past history.
                        Email support:
                        support@xyz.com
                        """)
                    }
        }
    }
    
}
