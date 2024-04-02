//
//  TaxRateModel.swift
//  TaxCalculator
//
//  Created by Adi Amoyal on 02/04/2024.
//

import Foundation

struct TaxRateModel: Codable {
    
    let zipCode, totalRate, stateRate, cityRate: String
    let countyRate, additionalRate: String
    
    var rate: Double {
        return (Double(totalRate) ?? 0.0) * 100
    }

        enum CodingKeys: String, CodingKey {
            case zipCode = "zip_code"
            case totalRate = "total_rate"
            case stateRate = "state_rate"
            case cityRate = "city_rate"
            case countyRate = "county_rate"
            case additionalRate = "additional_rate"
        }
    
}

typealias Welcome = [TaxRateModel]
