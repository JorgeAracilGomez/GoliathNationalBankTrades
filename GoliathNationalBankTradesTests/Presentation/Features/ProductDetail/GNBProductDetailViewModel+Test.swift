//
//  GNBProductDetailViewModel+Test.swift
//  GoliathNationalBankTradesTests
//
//  Created by Jorge Aracil Gomez on 27/1/23.
//

import XCTest
@testable import GoliathNationalBankTrades

final class GNBProductDetailViewModelTest: XCTestCase {
    
    var succesUseCase: GNBCurrencyRatesUseCase?
    var failureUseCase: GNBCurrencyRatesUseCase?
    
    var productSelectionUseCase: GNBProductTransactionsUseCase?
    var productSelectionViewModel: GNBProductSelectionViewModel?
    
    var successViewModel: GNBProductDetailViewModel?
    var failureViewModel: GNBProductDetailViewModel?
    
    override func setUp() {
        super.setUp()
        productSelectionUseCase = DefaultGNBProductTransactionsUseCase(repository: GNBProductTransactionsRepositorySuccessMock())
        succesUseCase = DefaultGNBCurrencyRatesUseCase(repository: GNBCurrencyRatesRepositorySuccessMock())
        failureUseCase = DefaultGNBCurrencyRatesUseCase(repository: GNBCurrencyRatesRepositoryFailureMock())
        productSelectionViewModel = DefaultGNBProductSelectionViewModel(transactionsUseCase: productSelectionUseCase!)
        successViewModel = DefaultGNBProductDetailViewModel(currencyRatesUseCase: succesUseCase!)
        failureViewModel = DefaultGNBProductDetailViewModel(currencyRatesUseCase: failureUseCase!)
    }
    
    override func tearDown() {
        productSelectionUseCase = nil
        succesUseCase = nil
        failureUseCase = nil
        productSelectionViewModel = nil
        successViewModel = nil
        failureViewModel = nil
        super.tearDown()
    }
    
    func testViewDidLoad_UseCaseSucces() {
        let expectation = expectation(description: "When the UseCase executes successfully, it must correctly format the data in the inputModel to generate the view model. This model should have a product name (sku), totalBalance, and a correctly formatted transaction array.")

        successViewModel?.model.bind { model in
            guard let model = model else { return }
            XCTAssertNotNil(model)
            XCTAssertEqual(model.sku, "T217221")
            XCTAssertEqual(model.totalBalance, "6.783,20 EUR")
            XCTAssertTrue(model.transactions.count == 2)
            XCTAssertEqual(model.transactions[0].originalValue, "8.776,45 SEK")
            XCTAssertEqual(model.transactions[0].convertedValue, "808,84 EUR")
            XCTAssertEqual(model.transactions[1].originalValue, "9.004,58 AUD")
            XCTAssertEqual(model.transactions[1].convertedValue, "5.974,36 EUR")
                        
            expectation.fulfill()
        }
        
        successViewModel?.error.bind { error in
            guard let _ = error else { return }
            XCTFail("Successfully test must not have an error when the usecase is executed")
        }
        
        productSelectionViewModel?.model.bind { model in
            guard let model = model else { return }
            XCTAssertNotNil(model)
            self.productSelectionViewModel?.selectCell(atIndex: 7)
        }

        productSelectionViewModel?.productDetailModel.bind { productDetailModel in
            guard let productDetailModel = productDetailModel else { return }
            self.successViewModel?.viewDidLoad(forInputModel: productDetailModel)
        }

        productSelectionViewModel?.viewDidLoad()

        wait(for: [expectation], timeout: 10)
    }
    
    func testViewDidLoad_UseCaseFailure() {
        let expectation = expectation(description: "After the execution error of the UseCase, an error should be received and it should not be null")

        failureViewModel?.error.bind { error in
            guard let error = error else { return }
            XCTAssertNotNil(error)
            expectation.fulfill()
        }

        failureViewModel?.viewDidLoad(forInputModel: GNBProductSelectionModel(sku: "MockSKU", transactions: []))

        wait(for: [expectation], timeout: 10)
    }
    
    func testViewDidLoad_InputModelFailure() {
        let expectation = expectation(description: "If could not retrieve the inputModel, an error should be received and it should not be null")

        successViewModel?.error.bind { error in
            guard let error = error else { return }
            XCTAssertNotNil(error)
            expectation.fulfill()
        }

        successViewModel?.viewDidLoad(forInputModel: nil)

        wait(for: [expectation], timeout: 10)
    }
}
