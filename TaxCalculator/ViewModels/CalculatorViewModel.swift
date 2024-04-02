//
//  CalculatorViewModel.swift
//  TaxCalculator
//
//  Created by Adi Amoyal on 01/04/2024.
//

import Foundation

class CalculatorViewModel: ObservableObject {
    
    @Published var percent: String = ""
    @Published var price: String = ""
    @Published var isLoading: Bool = false
    @Published var beforeTax: Double = 0.0
    @Published var tax: Double = 0.0
    
    func calculate() {
        isLoading = true
        if let percent = Double(percent),
           let price = Double(price) {
            self.beforeTax = price / (1 + percent / 100)
            self.tax = price - beforeTax
            clearTextFields()
            isLoading = false
        } else {
            print("ERROR")
        }
    }
    
    func clearTextFields() {
        self.percent = ""
        self.price = ""
    }
}
