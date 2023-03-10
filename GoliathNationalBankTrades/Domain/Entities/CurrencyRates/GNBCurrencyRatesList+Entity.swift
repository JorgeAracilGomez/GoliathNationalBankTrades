//
//  GNBCurrencyRatesList+Entity.swift
//  GoliathNationalBankTrades
//
//  Created by Jorge Aracil Gomez on 26/1/23.
//

import Foundation

struct GNBCurrencyRatesListEntity {
    
    /// Array representation for all the conversion rates
    var rates: [GNBCurrencyRatesEntity]?
    
    init(decodable: GNBCurrencyRatesListDecodable) {
        self.rates = decodable.rates?.map({ ratesDecodable in
            GNBCurrencyRatesEntity(decodable: ratesDecodable)
        })
    }
}
