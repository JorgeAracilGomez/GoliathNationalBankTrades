//
//  GNBCurrencyRates+Repository.swift
//  GoliathNationalBankTrades
//
//  Created by Jorge Aracil Gomez on 26/1/23.
//

import Foundation

// MARK: GNBCurrencyRatesRepository Protocol

protocol GNBCurrencyRatesRepository {
    
    /// Method that fetch all the currency rates available
    /// - Parameter completion: Returns s currency rates list Decodable or an error.
    func getConversionRates(completion: @escaping (Result<GNBCurrencyRatesListDecodable, GNBError>) -> Void)
}

// MARK: DefaultGNBCurrencyRatesRepository Class

final class DefaultGNBCurrencyRatesRepository: GNBCurrencyRatesRepository {
    
    private let endpoint = GNBEndpoint.currencyRates.rawValue
    private weak var task: URLSessionTask?
    
    func getConversionRates(completion: @escaping (Result<GNBCurrencyRatesListDecodable, GNBError>) -> Void) {
                
        task?.cancel()
        
        guard let url = URL(string: endpoint) else {
            let error: GNBError = .serviceError(message: "Malformed URL for getTransactions in GNBCurrencyRatesRepository")
            completion(.failure(error))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Accept")

        task = URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
            self.mannageResponse(data: data, response: response, error: error, completion: completion)
        })
        
        task?.resume()
    }
}

// MARK: DefaultGNBCurrencyRatesRepository Response Mannagement

extension DefaultGNBCurrencyRatesRepository {
    
    func mannageResponse(data: Data?, response: URLResponse?, error: Error?, completion: @escaping (Result<GNBCurrencyRatesListDecodable, GNBError>) -> Void) {
                                
        if (response as? HTTPURLResponse)?.statusCode != 200, let error = error {
            let error: GNBError = .serviceError(message: error.localizedDescription)
            completion(.failure(error))
        }
        
        guard let data = data else {
            let error: GNBError = .serviceError(message: "No Data Received when fetching in GNBCurrencyRatesRepository")
            completion(.failure(error))
            return
        }
        
        guard let decodable = try? JSONDecoder().decode(GNBCurrencyRatesListDecodable.self, from: data) else {
            completion(.failure(GNBError.decodeError(forDecodable: "GNBCurrencyRatesListDecodable")))
            return
        }
        
        completion(.success(decodable))
    }
}
