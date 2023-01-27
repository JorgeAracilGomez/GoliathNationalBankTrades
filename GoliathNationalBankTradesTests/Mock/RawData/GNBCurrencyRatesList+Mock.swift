//
//  GNBCurrencyRatesList+Mock.swift
//  GoliathNationalBankTradesTests
//
//  Created by Jorge Aracil Gomez on 27/1/23.
//

import Foundation
import XCTest

final class GNBCurrencyRatesListMock:  XCTestCase {
    
    static func makeJsonMock() -> Data {
        return Data("[{\"from\":\"EUR\",\"to\":\"USD\",\"rate\":1.04},{\"from\":\"USD\",\"to\":\"EUR\",\"rate\":0.96},{\"from\":\"GBP\",\"to\":\"EUR\",\"rate\":1.16},{\"from\":\"JPY\",\"to\":\"USD\",\"rate\":0.0073},{\"from\":\"AUD\",\"to\":\"INR\",\"rate\":55.29},{\"from\":\"CAD\",\"to\":\"USD\",\"rate\":0.74},{\"from\":\"SEK\",\"to\":\"USD\",\"rate\":0.096},{\"from\":\"RUB\",\"to\":\"SEK\",\"rate\":0.17},{\"from\":\"INR\",\"to\":\"EUR\",\"rate\":0.012}]\n".utf8)
    }
}
