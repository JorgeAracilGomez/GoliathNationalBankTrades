//
//  GNBProductTransactionsUseCase+Test.swift
//  GoliathNationalBankTradesTests
//
//  Created by Jorge Aracil Gomez on 27/1/23.
//

import XCTest
@testable import GoliathNationalBankTrades

final class GNBProductTransactionsUseCaseTest: XCTestCase {
    
    var succesUseCase: GNBProductTransactionsUseCase?
    var failureUseCase: GNBProductTransactionsUseCase?
    
    override func setUp() {
        super.setUp()
        succesUseCase = DefaultGNBProductTransactionsUseCase(repository: GNBProductTransactionsRepositorySuccessMock())
        failureUseCase = DefaultGNBProductTransactionsUseCase(repository: GNBProductTransactionsRepositoryFailureMock())
    }
    
    override func tearDown() {
        succesUseCase = nil
        failureUseCase = nil
        super.tearDown()
    }
    
    func testGNBProductTransactionsUseCaseTest_Success() {
        let expectation = expectation(description: "You must obtain a valid decodable that contains 353 transactions and that the sku, amount and currency fields are not null for each of them")

        succesUseCase?.execute { result in
            switch result {
            case .success(let decodable):
                XCTAssertNotNil(decodable.transactions)
                XCTAssertTrue(decodable.transactions?.count == 353)

                guard let transactions = decodable.transactions else {
                    XCTFail("Can not unwrap the transactions values")
                    return
                }

                for transaction in transactions {
                    XCTAssertNotNil(transaction.sku)
                    XCTAssertNotNil(transaction.amount)
                    XCTAssertNotNil(transaction.currency)
                }

                expectation.fulfill()

            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
        }

        wait(for: [expectation], timeout: 10)
    }
    
    func testGNBProductTransactionsUseCase_Failure() {
        let expectation = expectation(description: "You should get an error and it should not be null")
        
        failureUseCase?.execute { result in
            switch result {
            case .success(_):
                XCTFail("Failure test must not succedd when the usecase is executed")
            case .failure(let error):
                XCTAssertNotNil(error)
                
                expectation.fulfill()
            }
        }
        
        wait(for: [expectation], timeout: 5)
    }
}
