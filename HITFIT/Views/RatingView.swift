//
//  RatingView.swift
//  HITFIT
//
//  Created by Owner on 8/31/25.
//

import SwiftUI

struct RatingView: View {
    var body: some View {
        HStack {
            ForEach(0 ..< 5) { _ in
                Image(systemName: "waveform.path.ecg")
                    .foregroundColor(.gray)
                    .font(.largeTitle)
            }
        }    }
}

#Preview(traits: .sizeThatFitsLayout) {    RatingView()
}
