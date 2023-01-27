//
//  GNBProductSelectionViewController+Constraints.swift
//  GoliathNationalBankTrades
//
//  Created by Jorge Aracil Gomez on 25/1/23.
//

import UIKit

// MARK: GNBProductSelectionViewController - Constraints

extension GNBProductSelectionViewController {
    
    func setupProductsTableViewConstraints() {
        NSLayoutConstraint.activate([
            productsTableView.topAnchor.constraint(equalTo: view.safeTopAnchor),
            productsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            productsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            productsTableView.bottomAnchor.constraint(equalTo: view.safeBottomAnchor),
        ])
    }
}
