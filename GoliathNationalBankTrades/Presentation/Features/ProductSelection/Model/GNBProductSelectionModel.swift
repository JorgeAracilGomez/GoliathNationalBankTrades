//
//  GNBProductSelectionModel.swift
//  GoliathNationalBankTrades
//
//  Created by Jorge Aracil Gomez on 25/1/23.
//

import Foundation

struct GNBProductSelectionModel {
    /// The product Key
    var sku: String
    /// Array representation of all transactions made for that SKU
    var transactions: [GNBTransactionEntity]
}
