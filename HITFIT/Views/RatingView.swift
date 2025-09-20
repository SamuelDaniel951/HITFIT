//
//  RatingView.swift
//  HITFIT
//
//  Created by Owner on 8/31/25.
//

import SwiftUI

struct RatingView: View {
    @Binding var rating: Int   // 1
    let maximumRating = 5      // 2
    
    let onColor = Color.red    // 3
    let offColor = Color.gray
    
    var body: some View {
        HStack {
            ForEach(1 ..< maximumRating + 1, id: \.self) { index in
                Image(systemName: "waveform.path.ecg")
                    .foregroundColor(index > rating ? offColor : onColor) // 4
                    .font(.largeTitle)
                    .onTapGesture {   // 5
                        rating = index
                    }
            }
        }
    }
}


#Preview(traits: .sizeThatFitsLayout) {
    RatingView(rating: .constant(3))}
