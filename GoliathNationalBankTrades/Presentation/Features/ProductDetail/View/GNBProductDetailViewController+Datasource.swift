//
//  GNBProductDetailViewController+Datasource.swift
//  GoliathNationalBankTrades
//
//  Created by Jorge Aracil Gomez on 26/1/23.
//

import UIKit

// MARK: CellIdentifiers

extension GNBProductDetailTableViewDatasource {
    enum CellIdentifiers {
        static let transactionTableViewCell = "TransactionTableViewCell"
    }
}

// MARK: GNBProductDetail - TableViewDatasource

final class GNBProductDetailTableViewDatasource: NSObject, UITableViewDataSource {
    
    var tableView: UITableView
    var viewModel: GNBProductDetailViewModel
    
    init(tableView: UITableView, viewModel: GNBProductDetailViewModel) {
        self.tableView = tableView
        self.viewModel = viewModel
    }
    
    func registerCells() {
        tableView.register(GNBProductTransactionCell.self, forCellReuseIdentifier: CellIdentifiers.transactionTableViewCell)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.model.value?.transactions.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let transaction = self.viewModel.model.value?.transactions[indexPath.row],
           let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.transactionTableViewCell, for: indexPath) as? GNBProductTransactionCell {
            
            cell.selectionStyle = .none
            cell.configure(withModel: transaction)
            return cell
        }
        
        return UITableViewCell()
    }
}
