//
//  GNBProductTransactionList+Decodable.swift
//  GoliathNationalBankTrades
//
//  Created by Jorge Aracil Gomez on 24/1/23.
//

import Foundation

struct GNBProductTransactionListDecodable: Codable {
    
    /// Array representation for all the transactions
    var transactions: [GNBTransactionDecodable]?
    
    /// Decodes the info for non-primaryKey response json data.
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        transactions = try container.decode([GNBTransactionDecodable].self)
    }
}
