//
//  GNBError.swift
//  GoliathNationalBankTrades
//
//  Created by Jorge Aracil Gomez on 26/1/23.
//

import Foundation

enum GNBError: Error {
    case serviceError(message: String)
    case decodeError(forDecodable: String)
    case parseError(message: String)
}
