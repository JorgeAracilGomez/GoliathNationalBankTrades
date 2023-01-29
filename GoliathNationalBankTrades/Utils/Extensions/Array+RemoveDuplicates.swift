//
//  Array+RemoveDuplicates.swift
//  GoliathNationalBankTrades
//
//  Created by Jorge Aracil Gomez on 26/1/23.
//

import UIKit

extension Array where Element: Hashable {
    
    /// This extension allows you to eliminate duplicate values ​​contained in an array as long as they are of Hashable type.
    /// - Returns: An array of the unique values for the input elements.
    func removingDuplicates() -> [Element] {
        var addedDict = [Element: Bool]()
        return filter { addedDict.updateValue(true, forKey: $0) == nil }
    }
}
