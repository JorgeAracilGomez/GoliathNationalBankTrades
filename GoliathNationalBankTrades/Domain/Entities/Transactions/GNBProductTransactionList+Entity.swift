//
//  GNBProductTransactionList+Entity.swift
//  GoliathNationalBankTrades
//
//  Created by Jorge Aracil Gomez on 24/1/23.
//

import Foundation

struct GNBProductTransactionListEntity {
    
    /// Array representation for all the transactions
    var transactions: [GNBTransactionEntity]?
    
    init(decodable: GNBProductTransactionListDecodable) {
        self.transactions = decodable.transactions?.map({ transactionsDecodable in
            GNBTransactionEntity(decodable: transactionsDecodable)
        })
    }
}
