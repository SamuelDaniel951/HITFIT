//
//  DateExtension.swift
//  HITFIT
//
//  Created by Owner on 9/6/25.
//

import Foundation

extension Date {
    func formatted(as format: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
}
