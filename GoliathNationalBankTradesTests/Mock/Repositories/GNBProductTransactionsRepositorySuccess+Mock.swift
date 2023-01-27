//
//  GNBProductTransactionsRepositorySuccess+Mock.swift
//  GoliathNationalBankTradesTests
//
//  Created by Jorge Aracil Gomez on 27/1/23.
//

import XCTest
@testable import GoliathNationalBankTrades

final class GNBProductTransactionsRepositorySuccessMock: GNBProductTransactionsRepository {
    
    func getTransactions(completion: @escaping (Result<GoliathNationalBankTrades.GNBProductTransactionListDecodable, GoliathNationalBankTrades.GNBError>) -> Void) {
        let json = GNBProductTransactionListMock.makeJsonMock()
        guard let decodable = try? JSONDecoder().decode(GNBProductTransactionListDecodable.self, from: json) else { return }
        completion(.success(decodable))
    }
}
