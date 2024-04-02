//
//  TaxRateDataService.swift
//  TaxCalculator
//
//  Created by Adi Amoyal on 02/04/2024.
//

import Foundation
import Combine

class TaxRateDataService {
    
    @Published var taxRate: [TaxRateModel] = []
    var taxRateSubscription: AnyCancellable?
    
    func getTaxRate(zip: String) {
        guard let url = URL(string: "https://api.api-ninjas.com/v1/salestax?zip_code=\(zip)") else { return }

        var request = URLRequest(url: url)
        request.setValue("f6mIG3zZpw2yYBdJbmEOeA==NkYaRD9XnpAgzzgg", forHTTPHeaderField: "X-Api-Key")
        
        taxRateSubscription = NetworkingManager.download(request: request)
            .decode(type: [TaxRateModel].self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkingManager.handleCompletion,
                  receiveValue: { [weak self] returnedRate in
                self?.taxRate = returnedRate
                self?.taxRateSubscription?.cancel()
            })
    }
}
