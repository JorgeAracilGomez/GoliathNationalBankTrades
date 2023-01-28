//
//  GNBProductSelectorCell+Constants.swift
//  GoliathNationalBankTrades
//
//  Created by Jorge Aracil Gomez on 25/1/23.
//

import UIKit

// MARK: GNBProductSelectorCell - Constants

extension GNBProductSelectorCell {
    
    enum Constants {
        static let labelsNumberOfLines = 1
        static let replacingLabelString = "%s"
        static let shadowViewCornerRadius: CGFloat = 3
        static let shadowViewOffset = CGSize(width: 0, height: 1.75)
        static let shadowViewRadius: CGFloat = 1.7
        static let shadowViewOpacity: Float = 0.45
    }
    
    enum Localizables {
        static let subtitleLabel = "%@ transactions made"
    }
    
    enum Images {
        static let transactionIcon = UIImage(systemName: "arrow.left.arrow.right.square")
        static let chevronIcon = UIImage(systemName: "chevron.compact.right")
    }
    
    enum Fonts {
        static let titleLabel = UIFont(name: "Helvetica-Bold", size: 20.0)
        static let subtitleLabel = UIFont(name: "Helvetica-Light", size: 15)
    }
    
    enum AccessibilityIdentifiers {
        static let transactionIcon = "GNBProductSelectorCellTransactionIcon"
        static let titleLabel = "GNBProductSelectorCellTitleLabel"
        static let subtitleLabel = "GNBProductSelectorCellSubitleLabel"
        static let showDetailIcon = "GNBProductSelectorCellShowDetailIcon"
    }
}
