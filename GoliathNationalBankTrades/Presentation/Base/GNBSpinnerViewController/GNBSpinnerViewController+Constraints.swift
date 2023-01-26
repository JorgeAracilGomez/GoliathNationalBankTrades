//
//  GNBSpinnerViewController+Constraints.swift
//  GoliathNationalBankTrades
//
//  Created by Jorge Aracil Gomez on 26/1/23.
//

import UIKit

// MARK: GNBSpinnerViewController - Constraints

extension GNBSpinnerViewController {
    
    func setupSpinnerViewConstraints() {
        NSLayoutConstraint.activate([
            spinner.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            spinner.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
