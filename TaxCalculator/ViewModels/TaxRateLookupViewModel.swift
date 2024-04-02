//
//  TaxRateLookupViewModel.swift
//  TaxCalculator
//
//  Created by Adi Amoyal on 01/04/2024.
//

import Foundation
import SwiftUI

class TaxRateLookupViewModel: ObservableObject {
    @Published var streetAddress: String = ""
    @Published var city: String = ""
    @Published var zip: String = ""
    
    func searchForTaxRate() {
        print(streetAddress)
        print(city)
        print(zip)
    }
}
