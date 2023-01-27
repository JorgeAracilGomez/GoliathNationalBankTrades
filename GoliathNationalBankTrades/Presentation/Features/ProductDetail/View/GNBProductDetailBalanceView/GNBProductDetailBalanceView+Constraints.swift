//
//  GNBProductDetailBalanceView+Constraints.swift
//  GoliathNationalBankTrades
//
//  Created by Jorge Aracil Gomez on 26/1/23.
//

import UIKit

extension GNBProductDetailBalanceView {
    
    private enum Constraints {
        static let shadowViewBotom: CGFloat = 3.0
        static let productNameLabelLeading: CGFloat = 18.0
        static let productNameLabelTrailing: CGFloat = 18.0
        static let totalBalanceLabelTop: CGFloat = 5.0
        static let totalBalanceLabelBottom: CGFloat = 18.0
    }
    
    func setupShadowViewConstraints() {
        NSLayoutConstraint.activate([
            shadowView.topAnchor.constraint(equalTo: topAnchor),
            shadowView.leadingAnchor.constraint(equalTo: leadingAnchor),
            shadowView.trailingAnchor.constraint(equalTo: trailingAnchor),
            shadowView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Constraints.shadowViewBotom),
        ])
    }
    
    func setupProductNameLabelConstraints() {
        NSLayoutConstraint.activate([
            productNameLabel.topAnchor.constraint(equalTo: shadowView.topAnchor),
            productNameLabel.leadingAnchor.constraint(equalTo: shadowView.leadingAnchor, constant: Constraints.productNameLabelLeading),
            productNameLabel.trailingAnchor.constraint(equalTo: shadowView.trailingAnchor, constant: -Constraints.productNameLabelTrailing),
        ])
    }
    
    func setupTotalBalanceLabelConstraints() {
        NSLayoutConstraint.activate([
            totalBalanceLabel.topAnchor.constraint(equalTo: productNameLabel.bottomAnchor, constant: Constraints.totalBalanceLabelTop),
            totalBalanceLabel.leadingAnchor.constraint(equalTo: productNameLabel.leadingAnchor),
            totalBalanceLabel.trailingAnchor.constraint(equalTo: productNameLabel.trailingAnchor),
            totalBalanceLabel.bottomAnchor.constraint(equalTo: shadowView.bottomAnchor, constant: -Constraints.totalBalanceLabelBottom)
        ])
    }
}

