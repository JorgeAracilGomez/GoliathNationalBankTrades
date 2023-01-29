//
//  Double+FormatNumberToString.swift
//  GoliathNationalBankTrades
//
//  Created by Jorge Aracil Gomez on 29/1/23.
//

import Foundation

extension Double {
    
    /// This method returns the value in String of a Double value rounded to 2 digits and with the currency
    /// - Parameter currency: The string representation for the currency
    /// - Parameter decimals: number of decimal precision for the conversion
    /// - Returns: String value of a Double value rounded to 2 digits and with the currency
    func formatAmountNumberToString(withDecimals decimals: Int = 2, wihCurrency currency: String)  -> String {
        let nf = NumberFormatter()
        nf.numberStyle = .decimal
        nf.locale = Locale(identifier: "ca_ES")
        nf.maximumFractionDigits = decimals
        nf.minimumFractionDigits = decimals
        
        let priceString = nf.string(from: NSNumber(value: self)) ?? ""
        
        return priceString + " \(currency)"
    }
}
