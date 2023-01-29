//
//  GNBCurrencyRates+UseCase.swift
//  GoliathNationalBankTrades
//
//  Created by Jorge Aracil Gomez on 26/1/23.
//

import Foundation

// MARK: GNBCurrencyRatesUseCase

protocol GNBCurrencyRatesUseCase {
    
    /// Method that fetch all the currency rates available
    /// - Parameter completion: Returns s currency rates list Entity or an error.
    func execute(completion: @escaping (Result<GNBCurrencyRatesListEntity, GNBError>) -> Void)
}

// MARK: DefaultGNBCurrencyRatesUseCase

final class DefaultGNBCurrencyRatesUseCase: GNBCurrencyRatesUseCase {
    
    private var repository: GNBCurrencyRatesRepository
    
    init(repository: GNBCurrencyRatesRepository = DefaultGNBCurrencyRatesRepository()) {
        self.repository = repository
    }
    
    func execute(completion: @escaping (Result<GNBCurrencyRatesListEntity, GNBError>) -> Void) {
        
        let completion: (Result<GNBCurrencyRatesListDecodable, GNBError>) -> Void = { result in
            switch result {
            case .success(let decodable):
                let entity = GNBCurrencyRatesListEntity(decodable: decodable)
                completion(.success(entity))
            case .failure(let error):
                completion(.failure(error))
            }
        }
        
        repository.getConversionRates(completion: completion)
    }
}
