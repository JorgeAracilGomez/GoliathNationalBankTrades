//
//  GNBCurrencyRatesRepositoryFailure+Mock.swift
//  GoliathNationalBankTradesTests
//
//  Created by Jorge Aracil Gomez on 27/1/23.
//

import XCTest
@testable import GoliathNationalBankTrades

final class GNBCurrencyRatesRepositoryFailureMock: GNBCurrencyRatesRepository {
    
    func getConversionRates(completion: @escaping (Result<GoliathNationalBankTrades.GNBCurrencyRatesListDecodable, GoliathNationalBankTrades.GNBError>) -> Void) {
        let error = GNBError.parseError(message: "Could not get the decodable for the service response")
        completion(.failure(error))
    }
}
