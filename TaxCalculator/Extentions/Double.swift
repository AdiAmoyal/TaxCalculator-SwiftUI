//
//  Double.swift
//  TaxCalculator
//
//  Created by Adi Amoyal on 01/04/2024.
//

import Foundation

extension Double {
    /// Converts a Double into string representation
    /// ```
    /// Convert 1.2345 to "1.23"
    /// ```
    func asNumberString() -> String {
        return String(format: "%.2f", self)
    }
}
