//
//  GNBCurrency+Entity.swift
//  GoliathNationalBankTrades
//
//  Created by Jorge Aracil Gomez on 28/1/23.
//

import Foundation

enum GNBCurrencyEntity: Equatable {
    
    case EUR, USD, GBP, JPY, AUD, CAD, SEK, RUB, INR
    case other(value: String)
    
    init(stringValue: String) {
        switch stringValue {
        case String(describing: GNBCurrencyEntity.EUR):
            self = .EUR
        case String(describing: GNBCurrencyEntity.USD):
            self = .USD
        case String(describing: GNBCurrencyEntity.GBP):
            self = .GBP
        case String(describing: GNBCurrencyEntity.JPY):
            self = .JPY
        case String(describing: GNBCurrencyEntity.AUD):
            self = .AUD
        case String(describing: GNBCurrencyEntity.CAD):
            self = .CAD
        case String(describing: GNBCurrencyEntity.SEK):
            self = .SEK
        case String(describing: GNBCurrencyEntity.RUB):
            self = .RUB
        case String(describing: GNBCurrencyEntity.INR):
            self = .INR
        default:
            self = .other(value: stringValue)
        }
    }
            
    var rawValue: String {
        get {
            switch self {
            case .EUR, .USD, .GBP, .JPY, .AUD, .CAD, .SEK, .RUB, .INR:
                return String(describing: self)
            case .other(let value):
                return value
            }
        }
    }
    
    static func == (lhs: GNBCurrencyEntity, rhs: GNBCurrencyEntity) -> Bool {
        lhs.rawValue == rhs.rawValue
    }
}
