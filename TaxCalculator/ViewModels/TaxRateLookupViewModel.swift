//
//  TaxRateLookupViewModel.swift
//  TaxCalculator
//
//  Created by Adi Amoyal on 01/04/2024.
//

import Foundation
import SwiftUI
import Combine

class TaxRateLookupViewModel: ObservableObject {
    
    @Published var streetAddress: String = ""
    @Published var city: String = ""
    @Published var zip: String = ""
    @Published var isLoading: Bool = false

    @Published var taxRate: TaxRateModel? = nil
    
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
        clearTextFields()
        isLoading = false
    }
    
    func clearTextFields() {
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
