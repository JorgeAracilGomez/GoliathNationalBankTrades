//
//  GNBProductSelectionViewModel.swift
//  GoliathNationalBankTrades
//
//  Created by Jorge Aracil Gomez on 25/1/23.
//

import Foundation

// MARK: GNBProductSelectionViewModel

protocol GNBProductSelectionViewModel: GNBProductSelectionViewModelInput, GNBProductSelectionViewModelOutput {}

protocol GNBProductSelectionViewModelInput {
    func viewDidLoad()
    func selectCell(atIndex index: Int)
}

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
    
    func getUniqueProductsSKU(forTransactions transactions: [GNBTransactionEntity]?) -> [String] {
        let productNames = transactions?.compactMap { $0.sku }
        guard let uniqueProducts = productNames?.removingDuplicates().sorted() else {
            let errorMessage = "Could not retrieve unique product keys for create model in GNBProductSelectionViewModel"
            self.createErrorModel(GNBError.parseError(message: errorMessage))
            return []
        }
        
        return uniqueProducts
    }
    
    func filterTransactionsFor(product: String, in model: GNBProductTransactionListEntity) -> [GNBTransactionEntity] {
        guard let transactions = model.transactions else { return [] }
        return transactions.filter({ $0.sku == product })
    }
    
    func createErrorModel(_ error: GNBError) {
        self.error.value = error
    }
}
