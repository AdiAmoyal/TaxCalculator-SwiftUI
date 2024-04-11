//
//  HomeViewModel.swift
//  TaxCalculator
//
//  Created by Adi Amoyal on 01/04/2024.
//

import Foundation
import SwiftUI
import Combine

class HomeViewModel: ObservableObject {
    
    @Published var selectedTab: Int = 0
    @Published var isLoading: Bool = false
    @Published var taxRate: TaxRateModel? = nil
    @Published var withTaxRate: Bool = false
    
    // MARK: Calculator View Variables
    @Published var percent: String = ""
    @Published var price: String = ""
    @Published var isPercentPin: Bool = false
    
    @Published var beforeTax: Double = 0.0
    @Published var tax: Double = 0.0
    
    // MARK: TaxRateLookup View Variables
    @Published var streetAddress: String = ""
    @Published var city: String = ""
    @Published var zip: String = ""
    
    private let taxRateDataService = TaxRateDataService()
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        addSubscribers()
    }
    
    func addSubscribers() {
        taxRateDataService.$taxRate
            .sink { [weak self] returnedTaxRate in
                if let taxRate = returnedTaxRate.first {
                    self?.taxRate = taxRate
                }
            }
            .store(in: &cancellables)
    }
    
    func getTaxRate() {
        isLoading = true
        taxRateDataService.getTaxRate(zip: zip)
        clearTaxRateLookupTextFields()
        isLoading = false
    }
    
    func calculate() {
        isLoading = true
        if let percent = Double(percent),
           let price = Double(price) {
            self.beforeTax = price / (1 + percent / 100)
            self.tax = price - beforeTax
            clearCalculatorTextFields()
            isLoading = false
        } else {
            print("ERROR")
        }
    }
    
    func clearCalculatorTextFields() {
        if !isPercentPin {
            self.percent = ""
        }
        self.price = ""
    }
    
    func clearTaxRateLookupTextFields() {
        self.streetAddress = ""
        self.city = ""
        self.zip = ""
    }
    
    func copyTaxRateToClipboard() {
        if let value = taxRate {
            UIPasteboard.general.string = value.rate.asNumberString()
        }
    }
    
}
