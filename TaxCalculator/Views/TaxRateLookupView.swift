//
//  TaxRateLookupView.swift
//  TaxCalculator
//
//  Created by Adi Amoyal on 01/04/2024.
//

import SwiftUI

struct TaxRateLookupView: View {
    var body: some View {
        VStack {
            Text("Tax Rate Lookup")
            
            Text(12.44.asCurrencyWith2Decimals())
        }
        
        
    }
}

struct TaxRateLookupView_Previews: PreviewProvider {
    static var previews: some View {
        TaxRateLookupView()
    }
}
