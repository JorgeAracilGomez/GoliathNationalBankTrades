//
//  GNBProductSelectionViewController.swift
//  GoliathNationalBankTrades
//
//  Created by Jorge Aracil Gomez on 24/1/23.
//

import UIKit

// MARK: - GNBProductSelectionViewController

final class GNBProductSelectionViewController: GNBBaseViewController {

    weak var coordinator: MainCoordinator?
    private var viewModel: GNBProductSelectionViewModel
    
    init(viewModel: GNBProductSelectionViewModel = DefaultGNBProductSelectionViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private (set) var productsTableView: UITableView = {
        let productsTableView = UITableView()
        productsTableView.translatesAutoresizingMaskIntoConstraints = false
        return productsTableView
    }()
    
    private lazy var productsTableViewDataSource: GNBProductSelectionTableViewDatasource = {
        let datasource = GNBProductSelectionTableViewDatasource(tableView: productsTableView, viewModel: viewModel)
        datasource.registerCells()
        return datasource
    }()
    
    private lazy var productsTableViewDelegate: GNBProductSelectionTableViewDelegate = {
        let delegate = GNBProductSelectionTableViewDelegate(viewModel: viewModel)
        return delegate
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setupBinding()
        setupView()
        self.viewModel.viewDidLoad()
    }
}

// MARK: - Setup Binding

extension GNBProductSelectionViewController {
    
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
        
        viewModel.productDetailModel.bind { [weak self] model in
            guard let self = self,
                  let model = model else { return }
            
            self.goToProductDetail(withModel: model)
        }
    }
}

// MARK: - Setup View

extension GNBProductSelectionViewController {
    
    private func setupView() {
        self.view.backgroundColor = .white
        setupNavigationBar()
        setupProductsTableView()
    }
    
    private func setupNavigationBar() {
        self.title = Localizables.navigationTitle
    }
    
    private func setupProductsTableView() {
        self.view.addSubview(productsTableView)
        productsTableView.backgroundColor = .systemGroupedBackground
        productsTableView.separatorStyle = .none
        productsTableView.dataSource = productsTableViewDataSource
        productsTableView.delegate = productsTableViewDelegate
        setupProductsTableViewConstraints()
    }
    
    private func reloadView() {
        DispatchQueue.main.async {
            self.productsTableView.reloadData()
        }
    }
}

// MARK: User Actions

extension GNBProductSelectionViewController {
 
    private func goToProductDetail(withModel model: GNBProductSelectionModel) {
        coordinator?.showProductDetail(withModel: model)
    }
}
