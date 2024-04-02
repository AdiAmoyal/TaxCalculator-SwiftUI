//
//  NetworkingManager.swift
//  TaxCalculator
//
//  Created by Adi Amoyal on 02/04/2024.
//

import Foundation
import Combine

class NetworkingManager {
    
    enum NetworkingError: LocalizedError {
        case badURLResponse(request: URLRequest)
        case unknown
        
        var errorDescription: String? {
            switch self {
            case .badURLResponse(request: let request): return "Bad response from REQUEST. \(request)"
            case .unknown: return "Unknown error occured."
            }
        }
    }
    
    static func download(request: URLRequest) -> AnyPublisher<Data, Error> {
        URLSession.shared.dataTaskPublisher(for: request)
            .subscribe(on: DispatchQueue.global(qos: .background))
            .tryMap({ try handleURLResponse(output: $0, request: request) })
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    static func handleURLResponse(output: URLSession.DataTaskPublisher.Output, request: URLRequest) throws -> Data {
        guard let response = output.response as? HTTPURLResponse,
              response.statusCode >= 200 && response.statusCode < 300 else {
            throw NetworkingError.badURLResponse(request: request)
        }
        return output.data
    }
    
    static func handleCompletion(completion: Subscribers.Completion<Error>) {
        switch completion {
        case .finished:
            break
        case .failure(let error):
            print(error.localizedDescription)
        }
    }
}
