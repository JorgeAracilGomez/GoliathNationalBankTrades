//
//  GNBEndpoint.swift
//  GoliathNationalBankTrades
//
//  Created by Jorge Aracil Gomez on 24/1/23.
//

import Foundation


/// Enpoints enumeration for get GNB API data
/// - productTrades: endpoint to retrieve all the data of the transactions made
/// - currencyRates: endpoint to retrieve all rates between different currencies
@frozen enum GNBEndpoint: String {
    case productTrades = "https://android-ios-service.herokuapp.com/transactions"
    case currencyRates = "https://android-ios-service.herokuapp.com/rates"
}
