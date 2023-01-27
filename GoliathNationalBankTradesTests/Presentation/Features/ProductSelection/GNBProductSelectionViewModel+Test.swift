//
//  GNBProductSelectionViewModel+Test.swift
//  GoliathNationalBankTradesTests
//
//  Created by Jorge Aracil Gomez on 27/1/23.
//

import XCTest
@testable import GoliathNationalBankTrades

final class GNBProductSelectionViewModelTest: XCTestCase {
    
    var succesUseCase: GNBProductTransactionsUseCase?
    var failureUseCase: GNBProductTransactionsUseCase?
    
    var successViewModel: GNBProductSelectionViewModel?
    var failureViewModel: GNBProductSelectionViewModel?
    
    override func setUp() {
        super.setUp()
        succesUseCase = DefaultGNBProductTransactionsUseCase(repository: GNBProductTransactionsRepositorySuccessMock())
        failureUseCase = DefaultGNBProductTransactionsUseCase(repository: GNBProductTransactionsRepositoryFailureMock())
        successViewModel = DefaultGNBProductSelectionViewModel(transactionsUseCase: succesUseCase!)
        failureViewModel = DefaultGNBProductSelectionViewModel(transactionsUseCase: failureUseCase!)
    }
    
    override func tearDown() {
        succesUseCase = nil
        failureUseCase = nil
        successViewModel = nil
        failureViewModel = nil
        super.tearDown()
    }
    
    func testViewDidLoad_UseCaseSucces() {
        let expectation = expectation(description: "After the correct execution of the UseCase, the model of the view must be created and it is binded, obtaining 68 unique products. For each of them, there must be a SKU and a valid array of transactions")
                
        successViewModel?.model.bind { model in
            guard let model = model else { return }
            XCTAssertNotNil(model)
            XCTAssertTrue(model.count == 68)
            
            for product in model {
                XCTAssertNotNil(product.sku)
                XCTAssertNotNil(product.transactions)
                
                for transaction in product.transactions {
                    XCTAssertNotNil(transaction)
                    XCTAssertNotNil(transaction.sku)
                    XCTAssertNotNil(transaction.amount)
                    XCTAssertNotNil(transaction.currency)
                }
            }
            
            expectation.fulfill()
        }
        
        successViewModel?.error.bind { error in
            guard let _ = error else { return }
            XCTFail("Successfully test must not have an error when the usecase is executed")
        }
        
        successViewModel?.viewDidLoad()
        
        wait(for: [expectation], timeout: 10)
    }
    
    func testViewDidLoad_UseCaseFailure() {
        let expectation = expectation(description: "After the execution error of the UseCase, an error should be received and it should not be null")
                
        failureViewModel?.error.bind { error in
            guard let error = error else { return }
            XCTAssertNotNil(error)
            expectation.fulfill()
        }
        
        failureViewModel?.viewDidLoad()
        
        wait(for: [expectation], timeout: 10)
    }
    
    func testSelectCell_Success() {
        let expectation = expectation(description: "When selecting any of the available products, a valid model must be created to propagate it that contains the product SKU and valid values ​​for each of its transactions.")
                
        successViewModel?.model.bind { [weak self] model in
            guard let self = self,
                  let model = model else { return }
            
            XCTAssertNotNil(model)
            self.successViewModel?.selectCell(atIndex: 0)
        }
        
        successViewModel?.productDetailModel.bind { model in
            guard let model = model else { return }
            XCTAssertNotNil(model)
            XCTAssertEqual(model.sku, "T108466")
            XCTAssertNotNil(model.transactions)
            
            for transaction in model.transactions {
                XCTAssertNotNil(transaction.sku)
                XCTAssertNotNil(transaction.amount)
                XCTAssertNotNil(transaction.currency)
            }
            
            expectation.fulfill()
        }
        
        successViewModel?.error.bind { error in
            guard let _ = error else { return }
            XCTFail("Successfully test must not have an error when the usecase is executed")
        }
        
        successViewModel?.viewDidLoad()
        
        wait(for: [expectation], timeout: 10)
    }
}
