//
//  GNBProductSelectionViewController+Datasource.swift
//  GoliathNationalBankTrades
//
//  Created by Jorge Aracil Gomez on 25/1/23.
//

import UIKit

// MARK: CellIdentifiers

extension GNBProductSelectionTableViewDatasource {
    enum CellIdentifiers {
        static let productTableViewCell = "ProductTableViewCell"
    }
}

// MARK: GNBProductSelection - TableViewDatasource

final class GNBProductSelectionTableViewDatasource: NSObject, UITableViewDataSource {
    
    var tableView: UITableView
    var viewModel: GNBProductSelectionViewModel
    
    init(tableView: UITableView, viewModel: GNBProductSelectionViewModel) {
        self.tableView = tableView
        self.viewModel = viewModel
    }
    
    func registerCells() {
        tableView.register(GNBProductSelectorCell.self, forCellReuseIdentifier: CellIdentifiers.productTableViewCell)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.model.value?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let product = self.viewModel.model.value?[indexPath.row],
           let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.productTableViewCell, for: indexPath) as? GNBProductSelectorCell {
            
            cell.selectionStyle = .none
            cell.configure(withTitle: product.sku, andTransactionsNumber: product.transactions.count)
            return cell
        }
        
        return UITableViewCell()
    }
}
