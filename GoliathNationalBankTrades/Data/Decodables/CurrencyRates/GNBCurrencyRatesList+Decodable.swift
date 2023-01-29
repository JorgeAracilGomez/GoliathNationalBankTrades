//
//  GNBCurrencyRatesList+Decodable.swift
//  GoliathNationalBankTrades
//
//  Created by Jorge Aracil Gomez on 26/1/23.
//

import Foundation

struct GNBCurrencyRatesListDecodable: Codable {
    
    /// Array representation for all the currency rates
    var rates: [GNBCurrencyRatesDecodable]?
    
    /// Decodes the info for non-primaryKey response json data.
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        rates = try container.decode([GNBCurrencyRatesDecodable].self)
    }
}
