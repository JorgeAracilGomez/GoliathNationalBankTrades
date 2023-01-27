//
//  GNBTransactionCurrencyConversionModel.swift
//  GoliathNationalBankTrades
//
//  Created by Jorge Aracil Gomez on 26/1/23.
//

import Foundation

struct GNBTransactionCurrencyConversionModel {
    /// String representation of the original amount. (Must be rounded and include the currency)
    var originalValue: String
    /// String representation of the amount after currency conversion. (Must be rounded and include the currency)
    var convertedValue: String
}
