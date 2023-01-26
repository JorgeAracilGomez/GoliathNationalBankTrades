//
//  GNBProductSelectionViewController+Delegate.swift
//  GoliathNationalBankTrades
//
//  Created by Jorge Aracil Gomez on 25/1/23.
//

import UIKit

// MARK: GNBProductSelectionViewController - TableViewDelegate

final class GNBProductSelectionTableViewDelegate: NSObject, UITableViewDelegate {
    
    private var viewModel: GNBProductSelectionViewModel
    
    init(viewModel: GNBProductSelectionViewModel) {
        self.viewModel = viewModel
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.selectCell(atIndex: indexPath.row)
    }
}
