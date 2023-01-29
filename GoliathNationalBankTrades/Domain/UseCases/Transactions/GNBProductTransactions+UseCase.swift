//
//  GNBProductTransactions+UseCase.swift
//  GoliathNationalBankTrades
//
//  Created by Jorge Aracil Gomez on 25/1/23.
//

import Foundation

// MARK: GNBProductTransactionsUseCase

protocol GNBProductTransactionsUseCase {
    
    /// Method that fetch the product transactions
    /// - Parameter completion: Returns a products transactions list Entity or an error.
    func execute(completion: @escaping (Result<GNBProductTransactionListEntity, GNBError>) -> Void)
}

// MARK: DefaultGNBProductTransactionsUseCase

final class DefaultGNBProductTransactionsUseCase: GNBProductTransactionsUseCase {
    
    private var repository: GNBProductTransactionsRepository
    
    init(repository: GNBProductTransactionsRepository = DefaultGNBProductTransactionsRepository()) {
        self.repository = repository
    }
    
    func execute(completion: @escaping (Result<GNBProductTransactionListEntity, GNBError>) -> Void) {
        
        let completion: (Result<GNBProductTransactionListDecodable, GNBError>) -> Void = { result in
            switch result {
            case .success(let decodable):
                let entity = GNBProductTransactionListEntity(decodable: decodable)
                completion(.success(entity))
            case .failure(let error):
                completion(.failure(error))
            }
        }
        
        repository.getTransactions(completion: completion)
    }
}
