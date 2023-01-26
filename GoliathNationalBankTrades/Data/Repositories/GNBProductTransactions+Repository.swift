//
//  GNBProductTransactions+Repository.swift
//  GoliathNationalBankTrades
//
//  Created by Jorge Aracil Gomez on 25/1/23.
//

import Foundation

// MARK: GNBProductTransactionsRepository Protocol

protocol GNBProductTransactionsRepository {
    func getTransactions(completion: @escaping (Result<GNBProductTransactionListDecodable, GNBError>) -> Void)
}

// MARK: DefaultGNBProductTransactionsRepository Class

final class DefaultGNBProductTransactionsRepository: GNBProductTransactionsRepository {
    
    private let endpoint = GNBEndpoint.productTrades.rawValue
    private weak var task: URLSessionTask?
    
    func getTransactions(completion: @escaping (Result<GNBProductTransactionListDecodable, GNBError>) -> Void) {
        
        task?.cancel()
        
        guard let url = URL(string: endpoint) else {
            let error: GNBError = .serviceError(message: "Malformed URL for getTransactions in GNBProductTransactionsRepository")
            completion(.failure(error))
            return
        }

        task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            self.mannageResponse(data: data, response: response, error: error, completion: completion)
        }
        
        task?.resume()
    }
}

// MARK: DefaultGNBProductTransactionsRepository Response Mannagement

extension DefaultGNBProductTransactionsRepository {
    
    func mannageResponse(data: Data?, response: URLResponse?, error: Error?, completion: @escaping (Result<GNBProductTransactionListDecodable, GNBError>) -> Void) {
                                
        if (response as? HTTPURLResponse)?.statusCode != 200, let error = error {
            let error: GNBError = .serviceError(message: error.localizedDescription)
            completion(.failure(error))
        }
        
        guard let data = data else {
            let error: GNBError = .serviceError(message: "No Data Received when fetching in GNBProductTransactionsRepository")
            completion(.failure(error))
            return
        }
        
        guard let decodable = try? JSONDecoder().decode([GNBTransactionDecodable].self, from: data) else {
            completion(.failure(GNBError.decodeError(forDecodable: "GNBProductTransactionListDecodable")))
            return
        }
        
        completion(.success(GNBProductTransactionListDecodable(transactions: decodable)))
    }
}
