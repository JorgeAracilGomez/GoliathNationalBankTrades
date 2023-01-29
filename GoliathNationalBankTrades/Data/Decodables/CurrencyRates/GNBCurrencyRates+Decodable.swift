//
//  GNBCurrencyRates+Decodable.swift
//  GoliathNationalBankTrades
//
//  Created by Jorge Aracil Gomez on 24/1/23.
//

import Foundation

struct GNBCurrencyRatesDecodable: Codable {
    
    /// Current currency unit representation
    var from: String?
    /// Currency unit representation after the change
    var to: String?
    /// Exchange rate between two currencies
    var rate: Double?
}
