//
//  GNBProductSelectionViewModel.swift
//  GoliathNationalBankTrades
//
//  Created by Jorge Aracil Gomez on 25/1/23.
//

import Foundation

// MARK: GNBProductSelectionViewModel

protocol GNBProductSelectionViewModel: GNBProductSelectionViewModelInput, GNBProductSelectionViewModelOutput {}

/// This protocol defines the input methods that the ViewModel accepts for communication between the View-ViewModel.
protocol GNBProductSelectionViewModelInput {
    func viewDidLoad()
    func selectCell(atIndex index: Int)
}

/// This protocol defines the output getter Box variables that the ViewModel uses for communication between the ViewModel-View.
protocol GNBProductSelectionViewModelOutput {
    var model: Box<[GNBProductSelectionModel]?> { get }
    var loadingStatus: Box<LoadingStatus?> { get }
    var error: Box<GNBError?> { get }
    var productDetailModel: Box<GNBProductSelectionModel?> { get }
}

// MARK: DefaultGNBProductSelectionViewModel

final class DefaultGNBProductSelectionViewModel: GNBProductSelectionViewModel {
    var transactionsUseCase: GNBProductTransactionsUseCase
    var entity: GNBProductTransactionListEntity?
    var model: Box<[GNBProductSelectionModel]?> = Box(nil)
    var loadingStatus: Box<LoadingStatus?> = Box(nil)
    var error: Box<GNBError?> = Box(nil)
    var productDetailModel: Box<GNBProductSelectionModel?> = Box(nil)
    
    init(transactionsUseCase: GNBProductTransactionsUseCase = DefaultGNBProductTransactionsUseCase()) {
        self.transactionsUseCase = transactionsUseCase
    }
}

// MARK: Input methods

extension DefaultGNBProductSelectionViewModel {
    
    func viewDidLoad() {
        fetchTransactionsData()
    }
    
    func selectCell(atIndex index: Int) {
        productDetailModel.value = model.value?[index]
    }
}

// MARK: Fetch Data

extension DefaultGNBProductSelectionViewModel {
    
    func fetchTransactionsData() {
        
        loadingStatus.value = .start
        transactionsUseCase.execute { result in
            switch result {
            case .success(let entity):
                self.loadingStatus.value = .stop
                self.entity = entity
                self.createModel(forModel: entity)
            case .failure(let error):
                self.loadingStatus.value = .stop
                self.createErrorModel(error)
            }
        }
    }
}

// MARK: Mannage Output Models

extension DefaultGNBProductSelectionViewModel {
    
    func createModel(forModel inputModel: GNBProductTransactionListEntity) {
        var transactions: [GNBProductSelectionModel] = []
        let uniqueProducts = getUniqueProductsSKU(forTransactions: inputModel.transactions)
        
        for productSKU in uniqueProducts {
            let filteredProducts = filterTransactionsFor(product: productSKU, in: inputModel)
            let newTransactionModel = GNBProductSelectionModel(sku: productSKU, transactions: filteredProducts)
            transactions.append(newTransactionModel)
        }
        
        self.model.value = transactions
    }
    
    /// This method creates an array of Strings containing the unique keys for the product SKU for a given list of transactions.
    /// - Parameter transactions: Array containing all transactions made for all products.
    /// - Returns: Array of Strings containing the unique keys for the product SKU.
    func getUniqueProductsSKU(forTransactions transactions: [GNBTransactionEntity]?) -> [String] {
        let productNames = transactions?.compactMap { $0.sku }
        guard let uniqueProducts = productNames?.removingDuplicates().sorted() else {
            let errorMessage = "Could not retrieve unique product keys for create model in GNBProductSelectionViewModel"
            self.createErrorModel(GNBError.parseError(message: errorMessage))
            return []
        }
        
        return uniqueProducts
    }
    
    /// This method filters a list of transactions for a product key, returning only transactions made for that product key.
    /// - Parameters:
    ///   - product: String representation of the product for filter Key.
    ///   - model: Model that contains a list of all transactions made for all products.
    /// - Returns: Array representation for all of the transactions made for the given product key.
    func filterTransactionsFor(product: String, in model: GNBProductTransactionListEntity) -> [GNBTransactionEntity] {
        guard let transactions = model.transactions else { return [] }
        return transactions.filter({ $0.sku == product })
    }
    
    /// This method inflates an error model for data binding with the viewController
    /// - Parameter error: Value of the error occurred
    func createErrorModel(_ error: GNBError) {
        self.error.value = error
    }
}
