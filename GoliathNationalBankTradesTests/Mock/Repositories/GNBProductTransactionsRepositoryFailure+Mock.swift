//
//  GNBProductTransactionsRepositoryFailure+Mock.swift
//  GoliathNationalBankTradesTests
//
//  Created by Jorge Aracil Gomez on 27/1/23.
//

import XCTest
@testable import GoliathNationalBankTrades

final class GNBProductTransactionsRepositoryFailureMock: GNBProductTransactionsRepository {
    
    func getTransactions(completion: @escaping (Result<GoliathNationalBankTrades.GNBProductTransactionListDecodable, GoliathNationalBankTrades.GNBError>) -> Void) {
        let error = GNBError.parseError(message: "Could not get the decodable for the service response")
        completion(.failure(error))
    }
}
