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
            productsTableView.topAnchor.constraint(equalTo: self.view.safeTopAnchor),
            productsTableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            productsTableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            productsTableView.bottomAnchor.constraint(equalTo: self.view.safeBottomAnchor),
        ])
    }
}
