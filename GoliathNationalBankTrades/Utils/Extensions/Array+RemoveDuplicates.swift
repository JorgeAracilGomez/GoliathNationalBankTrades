//
//  Array+RemoveDuplicates.swift
//  GoliathNationalBankTrades
//
//  Created by Jorge Aracil Gomez on 26/1/23.
//

import UIKit

// This extension allows you to eliminate duplicate values ​​contained in an array as long as they are of Hashable type.
extension Array where Element: Hashable {
    func removingDuplicates() -> [Element] {
        var addedDict = [Element: Bool]()
        return filter { addedDict.updateValue(true, forKey: $0) == nil }
    }

    /// Returns the unique values ​​contained in an array of Hashable elements
    mutating func removeDuplicates() {
        self = self.removingDuplicates()
    }
}
