//
//  GNBProductTransaction+Decodable.swift
//  GoliathNationalBankTrades
//
//  Created by Jorge Aracil Gomez on 24/1/23.
//

import Foundation

/// Data model that represents a transaction of a specific product for a specific sale value and in a specific currency.
struct GNBProductTransactionDecodable: Codable {
    
    /// Transaction product code
    var sku: String?
    /// Total amount of the transaction
    var amount: String?
    /// Representation of the currency used in the transaction
    var currency: Double?
}
