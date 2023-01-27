//
//  GNBProductDetailBalanceView+Constants.swift
//  GoliathNationalBankTrades
//
//  Created by Jorge Aracil Gomez on 26/1/23.
//

import UIKit

// MARK: GNBProductDetailBalanceView - Constants

extension GNBProductDetailBalanceView {
    
    enum Constants {
        static let labelsNumberOfLines = 1
        static let shadowViewCornerRadius: CGFloat = 3
        static let shadowViewOffset = CGSize(width: 0, height: 1.75)
        static let shadowViewRadius: CGFloat = 1
        static let shadowViewOpacity: Float = 0.45
    }
    
    enum Localizables {
        static let balanceLabel = "Total Balance: %@"
    }
    
    enum Images {
        static let transactionIcon = UIImage(systemName: "arrow.left.arrow.right")
    }
    
    enum Fonts {
        static let primaryLabel = UIFont.systemFont(ofSize: 25, weight: UIFont.Weight.bold)
    }
}
