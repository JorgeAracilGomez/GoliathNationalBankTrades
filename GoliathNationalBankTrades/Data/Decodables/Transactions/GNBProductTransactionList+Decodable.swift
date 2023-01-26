//
//  GNBProductTransactionList+Decodable.swift
//  GoliathNationalBankTrades
//
//  Created by Jorge Aracil Gomez on 24/1/23.
//

import Foundation

/// Data model that represents a list of all the transactions made.
struct GNBProductTransactionListDecodable: Codable {
    
    /// Array representation for all the transactions
    var transactions: [GNBTransactionDecodable]?
}
