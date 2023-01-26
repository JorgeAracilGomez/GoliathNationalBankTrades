//
//  GNBProductSelectorCell+Constraints.swift
//  GoliathNationalBankTrades
//
//  Created by Jorge Aracil Gomez on 25/1/23.
//

import UIKit

// MARK: GNBProductSelectorCell - Constraints

extension GNBProductSelectorCell {
    
    private enum Constraints {
        static let shadowViewTop: CGFloat = 8.0
        static let shadowViewLeading: CGFloat = 20.0
        static let shadowViewTrailing: CGFloat = 20.0
        static let shadowViewBottom: CGFloat = 8.0
        static let transactionIconTop: CGFloat = 12.0
        static let transactionIconHeight: CGFloat = 50.0
        static let transactionIconLeading: CGFloat = 10.0
        static let transactionIconBotom: CGFloat = 12.0
        static let titleLabelLeading: CGFloat = 20.0
        static let titleLabelHeight: CGFloat = 25.0
        static let showDetailIconLeading: CGFloat = 20.0
        static let showDetailIconTrailing: CGFloat = 20.0
        static let showDetailIconHeight: CGFloat = 20.0
    }
    
    func setupShadowViewConstraints() {
        NSLayoutConstraint.activate([
            shadowView.topAnchor.constraint(equalTo: topAnchor, constant: Constraints.shadowViewTop),
            shadowView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constraints.shadowViewLeading),
            shadowView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Constraints.shadowViewTrailing),
            shadowView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Constraints.shadowViewBottom),
        ])
    }
    
    func setupTransactionIconViewConstraints() {
        NSLayoutConstraint.activate([
            transactionIcon.topAnchor.constraint(equalTo: shadowView.topAnchor, constant: Constraints.transactionIconTop),
            transactionIcon.leadingAnchor.constraint(equalTo: shadowView.leadingAnchor, constant: Constraints.transactionIconLeading),
            transactionIcon.heightAnchor.constraint(equalToConstant: Constraints.transactionIconHeight),
            transactionIcon.widthAnchor.constraint(equalTo: transactionIcon.heightAnchor),
            transactionIcon.bottomAnchor.constraint(equalTo: shadowView.bottomAnchor, constant: -Constraints.transactionIconBotom),
        ])
    }
    
    func setupTitleLabelConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: transactionIcon.topAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: Constraints.titleLabelHeight),
            titleLabel.leadingAnchor.constraint(equalTo: transactionIcon.trailingAnchor, constant: Constraints.titleLabelLeading),
        ])
    }
    
    func setupSubtitleLabelConstraints() {
        NSLayoutConstraint.activate([
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            subtitleLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            subtitleLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            subtitleLabel.heightAnchor.constraint(equalTo: titleLabel.heightAnchor),
            subtitleLabel.bottomAnchor.constraint(equalTo: transactionIcon.bottomAnchor)
        ])
    }
    
    func setupShowDetailIconViewConstraints() {
        NSLayoutConstraint.activate([
            showDetailIcon.centerYAnchor.constraint(equalTo: shadowView.centerYAnchor),
            showDetailIcon.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: Constraints.showDetailIconLeading),
            showDetailIcon.trailingAnchor.constraint(equalTo: shadowView.trailingAnchor, constant: -Constraints.showDetailIconTrailing),
            showDetailIcon.heightAnchor.constraint(equalToConstant: Constraints.showDetailIconHeight),
            showDetailIcon.widthAnchor.constraint(equalTo: showDetailIcon.heightAnchor),
        ])
    }
}

