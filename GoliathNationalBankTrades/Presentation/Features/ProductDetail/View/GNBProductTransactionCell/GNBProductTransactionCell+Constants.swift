//
//  GNBProductTransactionCell+Constants.swift
//  GoliathNationalBankTrades
//
//  Created by Jorge Aracil Gomez on 26/1/23.
//

import UIKit

// MARK: GNBProductTransactionCell - Constants

extension GNBProductTransactionCell {
    
    enum Constants {
        static let labelsNumberOfLines = 1
    }

    enum Images {
        static let transactionIcon = UIImage(systemName: "arrow.left.arrow.right")
    }

    enum Fonts {
        static let primaryLabel = UIFont(name: "Helvetica", size: 20.0)
    }
    
    enum AccessibilityIdentifiers {
        static let originalValueLabel = "GNBProductTransactionCellOriginalValueLabel"
        static let transactionIcon = "GNBProductTransactionCellIcon"
        static let convertedValueLabel = "GNBProductTransactionCellConvertedValueLabel"
    }
}
