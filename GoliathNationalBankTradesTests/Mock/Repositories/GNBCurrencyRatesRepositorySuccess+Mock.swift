//
//  GNBCurrencyRatesRepositorySuccess+Mock.swift
//  GoliathNationalBankTradesTests
//
//  Created by Jorge Aracil Gomez on 27/1/23.
//

import XCTest
@testable import GoliathNationalBankTrades

final class GNBCurrencyRatesRepositorySuccessMock: GNBCurrencyRatesRepository {
    
    func getConversionRates(completion: @escaping (Result<GoliathNationalBankTrades.GNBCurrencyRatesListDecodable, GoliathNationalBankTrades.GNBError>) -> Void) {
        let json = GNBCurrencyRatesListMock.makeJsonMock()
        guard let decodable = try? JSONDecoder().decode(GNBCurrencyRatesListDecodable.self, from: json) else { return }
        completion(.success(decodable))
    }
}
