//
//  GNBProductDetailViewController+Constraints.swift
//  GoliathNationalBankTrades
//
//  Created by Jorge Aracil Gomez on 26/1/23.
//

import UIKit

// MARK: GNBProductDetailViewController - Constraints

extension GNBProductDetailViewController {
    
    func setupProductBalanceViewConstraints() {
        NSLayoutConstraint.activate([
            productBalanceView.topAnchor.constraint(equalTo: view.safeTopAnchor),
            productBalanceView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            productBalanceView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    func setupTransactionsTableViewConstraints() {
        NSLayoutConstraint.activate([
            transactionsTableView.topAnchor.constraint(equalTo: productBalanceView.bottomAnchor),
            transactionsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            transactionsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            transactionsTableView.bottomAnchor.constraint(equalTo: view.safeBottomAnchor)
        ])
    }
}
