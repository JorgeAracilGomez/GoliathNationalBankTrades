//
//  GNBCurrencyRates+Entity.swift
//  GoliathNationalBankTrades
//
//  Created by Jorge Aracil Gomez on 24/1/23.
//

import Foundation

/// Data model representing the exchange rate between two specific currencies
struct GNBCurrencyRatesEntity {
    
    /// Current currency unit representation
    var from: GNBCurrencyEntity?
    /// Currency unit representation after the change
    var to: GNBCurrencyEntity?
    /// Exchange rate between two currencies
    var rate: Double?
    
    init(decodable: GNBCurrencyRatesDecodable) {
        if let decodableFrom = decodable.from { self.from = GNBCurrencyEntity(stringValue: decodableFrom) }
        if let decodableTo = decodable.to { self.to = GNBCurrencyEntity(stringValue: decodableTo) }
        self.rate = decodable.rate
    }
}
