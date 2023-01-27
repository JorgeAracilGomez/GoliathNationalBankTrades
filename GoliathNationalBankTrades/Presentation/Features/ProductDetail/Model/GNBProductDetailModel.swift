//
//  GNBProductDetailModel.swift
//  GoliathNationalBankTrades
//
//  Created by Jorge Aracil Gomez on 26/1/23.
//

import Foundation

struct GNBProductDetailModel {
    /// The product Key
    var sku: String
    /// String representation of the total balance for all transactions formated for EUR currency
    var totalBalance: String
    /// Array of String representations for de transactions and its currency conversions.
    var transactions: [GNBTransactionCurrencyConversionModel]
}
