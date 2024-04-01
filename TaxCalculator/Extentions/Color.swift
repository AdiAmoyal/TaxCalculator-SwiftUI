//
//  Color.swift
//  TaxCalculator
//
//  Created by Adi Amoyal on 01/04/2024.
//

import Foundation
import SwiftUI

extension Color {
    static let theme = ColorTheme()
//    static let launch = LaunchTheme()
}

struct ColorTheme {
    let accent = Color("AccentColor")
    let background = Color("BackgroundColor")
    let blue = Color("BlueColor")
    let secondaryText = Color("SecondaryTextColor")
}
