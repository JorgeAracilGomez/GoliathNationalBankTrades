//
//  GNBProductTransactionCell+Constraints.swift
//  GoliathNationalBankTrades
//
//  Created by Jorge Aracil Gomez on 26/1/23.
//

import UIKit

// MARK: GNBProductTransactionCell - Constraints

extension GNBProductTransactionCell {
    
    private enum Constraints {
        static let transactionIconTop: CGFloat = 20.0
        static let transactionIconBotom: CGFloat = 20.0
        static let originalValueLabelTop: CGFloat = 10.0
        static let originalValueLabelLeading: CGFloat = 20.0
        static let originalValueLabelBotom: CGFloat = 10.0
        static let convertedValueLabelTrailing: CGFloat = 20.0
    }
    
    func setupOriginalValueLabelConstraints() {
        NSLayoutConstraint.activate([
            originalValueLabel.topAnchor.constraint(equalTo: topAnchor, constant: Constraints.originalValueLabelTop),
            originalValueLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constraints.originalValueLabelLeading),
            originalValueLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Constraints.originalValueLabelBotom),
        ])
    }
    
    func setupTransactionIconViewConstraints() {
        NSLayoutConstraint.activate([
            transactionIcon.topAnchor.constraint(equalTo: topAnchor, constant: Constraints.transactionIconTop),
            transactionIcon.leadingAnchor.constraint(equalTo: originalValueLabel.trailingAnchor),
            transactionIcon.heightAnchor.constraint(equalTo: transactionIcon.widthAnchor),
            transactionIcon.centerXAnchor.constraint(equalTo: centerXAnchor),
            transactionIcon.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Constraints.transactionIconBotom),
        ])
    }
    
    func setupConvertedValueLabelConstraints() {
        NSLayoutConstraint.activate([
            convertedValueLabel.topAnchor.constraint(equalTo: originalValueLabel.topAnchor),
            convertedValueLabel.leadingAnchor.constraint(equalTo: transactionIcon.trailingAnchor),
            convertedValueLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Constraints.convertedValueLabelTrailing),
            convertedValueLabel.bottomAnchor.constraint(equalTo: originalValueLabel.bottomAnchor),
        ])
    }
}
