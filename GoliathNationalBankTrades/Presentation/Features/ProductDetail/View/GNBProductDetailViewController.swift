//
//  GNBProductDetailViewController.swift
//  GoliathNationalBankTrades
//
//  Created by Jorge Aracil Gomez on 26/1/23.
//

import UIKit

// MARK: - GNBProductDetailViewController

final class GNBProductDetailViewController: GNBBaseViewController {

    weak var coordinator: MainCoordinator?
    private var viewModel: GNBProductDetailViewModel
    private var inputModel: GNBProductSelectionModel
    
    init(viewModel: GNBProductDetailViewModel = DefaultGNBProductDetailViewModel(),
         inputModel: GNBProductSelectionModel) {
        self.viewModel = viewModel
        self.inputModel = inputModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private (set) var productBalanceView: GNBProductDetailBalanceView = {
        let productBalanceView = GNBProductDetailBalanceView(frame: .zero)
        productBalanceView.translatesAutoresizingMaskIntoConstraints = false
        return productBalanceView
    }()
    
    private (set) var transactionsTableView: UITableView = {
        let transactionsTableView = UITableView()
        transactionsTableView.translatesAutoresizingMaskIntoConstraints = false
        return transactionsTableView
    }()
    
    private lazy var transactionsTableViewDataSource: GNBProductDetailTableViewDatasource = {
        let datasource = GNBProductDetailTableViewDatasource(tableView: transactionsTableView, viewModel: viewModel)
        datasource.registerCells()
        return datasource
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupIdleView()
        setupBinding()
        setupNavigationBar()
        self.viewModel.viewDidLoad(forInputModel: inputModel)
    }
}

// MARK: - Setup Binding

extension GNBProductDetailViewController {
    
    private func setupBinding() {
        
        viewModel.model.bind { [weak self] model in
            guard let self = self,
                  let _ = model else { return }
            
            self.reloadView()
        }
        
        viewModel.loadingStatus.bind { [weak self] status in
            guard let self = self,
                  let status = status else { return }
            
            switch status {
            case .start:
                self.showSpinner()
            case .stop:
                self.hideSpinner()
            }
        }
        
        viewModel.error.bind { [weak self] error in
            guard let self = self,
                  let error = error else { return }
            
            self.showAlert(error: error)
        }
    }
}

// MARK: - Setup View

extension GNBProductDetailViewController {
    
    private func setupIdleView() {
        self.view.backgroundColor = .white
    }
    
    private func setupView() {
        setupProductBalanceView()
        setupTransactionsTableView()
    }
    
    private func setupNavigationBar() {
        self.title = Localizables.navigationTitle
    }
    
    private func setupProductBalanceView() {
        self.view.addSubview(productBalanceView)
        productBalanceView.configure(
            withProductName: viewModel.model.value?.sku ?? "",
            withTotalBalance: viewModel.model.value?.totalBalance ?? "")
        setupProductBalanceViewConstraints()
    }
    
    private func setupTransactionsTableView() {
        self.view.addSubview(transactionsTableView)
        transactionsTableView.backgroundColor = .systemGroupedBackground
        transactionsTableView.separatorStyle = .singleLine
        transactionsTableView.dataSource = transactionsTableViewDataSource
        transactionsTableView.delegate = nil
        transactionsTableView.accessibilityIdentifier = AccessibilityIdentifiers.transactionsTableView
        setupTransactionsTableViewConstraints()        
    }
    
    private func reloadView() {
        DispatchQueue.main.async {
            self.setupView()
            self.transactionsTableView.reloadData()
        }
    }
}
