//
//  GNBTransaction+Entity.swift
//  GoliathNationalBankTrades
//
//  Created by Jorge Aracil Gomez on 25/1/23.
//

import Foundation

struct GNBTransactionEntity {
    
    /// Transaction product code
    var sku: String?
    /// Total amount of the transaction
    var amount: Double?
    /// Representation of the currency used in the transaction
    var currency: GNBCurrencyEntity?
    
    init(decodable: GNBTransactionDecodable) {
        self.sku = decodable.sku
        self.amount = decodable.amount
        if let decodableCurrency = decodable.currency { self.currency = GNBCurrencyEntity(stringValue: decodableCurrency) }
    }
}
