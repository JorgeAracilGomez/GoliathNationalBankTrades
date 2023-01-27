//
//  GNBProductDetailViewModel.swift
//  GoliathNationalBankTrades
//
//  Created by Jorge Aracil Gomez on 26/1/23.
//

import Foundation

// MARK: GNBProductDetailViewModel

protocol GNBProductDetailViewModel: GNBProductDetailViewModelInput, GNBProductDetailViewModelOutput {}

protocol GNBProductDetailViewModelInput {
    func viewDidLoad(forInputModel inputModel: GNBProductSelectionModel?)
}

protocol GNBProductDetailViewModelOutput {
    var inputModel: GNBProductSelectionModel? { get }
    var model: Box<GNBProductDetailModel?> { get }
    var loadingStatus: Box<LoadingStatus?> { get }
    var error: Box<GNBError?> { get }
    
}

// MARK: DefaultGNBProductDetailViewModel

final class DefaultGNBProductDetailViewModel: GNBProductDetailViewModel {
    var inputModel: GNBProductSelectionModel?
    var currencyRatesUseCase: GNBCurrencyRatesUseCase
    var entity: GNBCurrencyRatesListEntity?
    var model: Box<GNBProductDetailModel?> = Box(nil)
    var loadingStatus: Box<LoadingStatus?> = Box(nil)
    var error: Box<GNBError?> = Box(nil)
    
    
    init(currencyRatesUseCase: GNBCurrencyRatesUseCase = DefaultGNBCurrencyRatesUseCase()) {
        self.currencyRatesUseCase = currencyRatesUseCase
    }
}

// MARK: Input methods

extension DefaultGNBProductDetailViewModel {
    
    func viewDidLoad(forInputModel inputModel: GNBProductSelectionModel?) {
        self.inputModel = inputModel
        fetchTransactionsData()
    }
}

// MARK: Fetch Data

extension DefaultGNBProductDetailViewModel {
    
    func fetchTransactionsData() {
        
        loadingStatus.value = .start
        currencyRatesUseCase.execute { result in
            switch result {
            case .success(let entity):
                self.loadingStatus.value = .stop
                self.entity = entity
                self.createModel()
            case .failure(let error):
                self.loadingStatus.value = .stop
                self.createErrorModel(error)
            }
        }
    }
}

// MARK: Mannage Output Models

extension DefaultGNBProductDetailViewModel {
    
    func createModel() {
        guard let inputModel = inputModel else {
            let errorMessage = "Could not retrieve input data for create model GNBProductDetailModel"
            self.createErrorModel(GNBError.parseError(message: errorMessage))
            return
        }
        
        let totalBalance = getTransactionsTotalBalance(for: inputModel.transactions)
        let transactionsConvertedToEUR = getTransactionsWithEURCurrencyConvertedModel(for: inputModel.transactions)
        
        if error.value == nil {
            self.model.value = GNBProductDetailModel(sku: inputModel.sku,
                                                     totalBalance: totalBalance.formatAmountNumberToString(wihCurrency: "EUR"),
                                                     transactions: transactionsConvertedToEUR)
        }
    }
    
    /// This method return the Double value for total balance of the transactions converted to EUR Currency
    /// - Parameter transactions: Array value of all of the transactions.
    /// - Returns: Double value  for the total balance after the currency conversion
    func getTransactionsTotalBalance(for transactions: [GNBTransactionEntity]) -> Double {
        let totalBalance = transactions.reduce(0) { $0 + getCurrencyEURConversionFor($1) }
        return totalBalance
    }
    
    /// This method inflates a model with the String representation value for the input and output values for a transaction in the original value and in a converted to EUR value
    /// - Parameter transactions: Array representation of the original transactions.
    /// - Returns: Array representation for the transactions in string value containing the original and the EUR currency converted value.
    func getTransactionsWithEURCurrencyConvertedModel(for transactions: [GNBTransactionEntity]) -> [GNBTransactionCurrencyConversionModel]  {
        let transactionsConverted = transactions.compactMap { transaction in
            if let amount = transaction.amount, let currency = transaction.currency {
                let convertedAmount = getCurrencyEURConversionFor(transaction)
                return GNBTransactionCurrencyConversionModel(
                    originalValue: amount.formatAmountNumberToString(wihCurrency: currency),
                    convertedValue: convertedAmount.formatAmountNumberToString(wihCurrency: "EUR"))
            }
            
            return nil
        }
        
        return transactionsConverted
    }
    
    /// This method conver ain input pair of amount-currency to a new value for converted to EUR currency amount
    /// - Parameter transaction: Value of the transaction that you want to convert to EUR
    /// - Returns: Amount value converted to EUR
    func getCurrencyEURConversionFor(_ transaction: GNBTransactionEntity) -> Double {
        guard let inputCurrency = transaction.currency,
              let currentRates = entity?.rates,
              let currentAmount = transaction.amount else {
            
            let errorMessage = "Could not get the EUR currency conversion for the transactions"
            self.createErrorModel(GNBError.parseError(message: errorMessage))
            return 0
        }
        
        let currencyConversionRate = getCurrencyConversion(for: inputCurrency, to: "EUR", rates: currentRates)
        return currentAmount * currencyConversionRate
    }

    
    /// This method return the currency conversion rate based on an input and ouput currency values and an arrray or currency rates
    /// - Parameters:
    ///   - inputCurrency: The initial currency for the conversion
    ///   - outputCurrency: The final currency for the conversion
    ///   - rates: Available currency conversions
    /// - Returns: Double value for the intut-output currency conversion
    func getCurrencyConversion(for inputCurrency: String, to outputCurrency: String, rates: [GNBCurrencyRatesEntity]?) -> Double {

        if inputCurrency == outputCurrency { return 1.0 }
        
        guard let rates = rates,
              let availableConversion = rates.filter({ $0.from == inputCurrency }).first,
              let availableRate = availableConversion.rate,
              let iterationCurrency = availableConversion.to else {
            
            let errorMessage = "Could not get the EUR currency conversion for the transactions"
            self.createErrorModel(GNBError.parseError(message: errorMessage))
            return 0
        }
        
        var acumulatedRateConversion = availableRate
        if availableConversion.to != outputCurrency {
            acumulatedRateConversion *= getCurrencyConversion(for: iterationCurrency, to: outputCurrency, rates: rates)
        }
        
        return acumulatedRateConversion
    }
    
    /// This method inflates an error model for data binding with the viewController
    /// - Parameter error: Value of the error occurred
    func createErrorModel(_ error: GNBError) {
        self.error.value = error
    }
}
