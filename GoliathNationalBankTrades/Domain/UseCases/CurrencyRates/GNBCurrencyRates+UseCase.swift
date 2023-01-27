//
//  GNBCurrencyRates+UseCase.swift
//  GoliathNationalBankTrades
//
//  Created by Jorge Aracil Gomez on 26/1/23.
//

import Foundation

protocol GNBCurrencyRatesUseCase {
    func execute(completion: @escaping (Result<GNBCurrencyRatesListEntity, GNBError>) -> Void)
}

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
