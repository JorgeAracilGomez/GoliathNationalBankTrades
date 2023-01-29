//
//  GNBTransaction+Decodable.swift
//  GoliathNationalBankTrades
//
//  Created by Jorge Aracil Gomez on 25/1/23.
//

import Foundation

struct GNBTransactionDecodable: Codable {
    
    /// Transaction product code
    var sku: String?
    /// Total amount of the transaction
    var amount: Double?
    /// Representation of the currency used in the transaction
    var currency: String?
}
