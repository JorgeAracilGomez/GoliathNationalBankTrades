//
//  GNBCurrencyRatesUseCase+Test.swift
//  GoliathNationalBankTradesTests
//
//  Created by Jorge Aracil Gomez on 27/1/23.
//

import XCTest
@testable import GoliathNationalBankTrades

final class GNBCurrencyRatesUseCaseTest: XCTestCase {
    
    var succesUseCase: GNBCurrencyRatesUseCase?
    var failureUseCase: GNBCurrencyRatesUseCase?
    
    override func setUp() {
        super.setUp()
        succesUseCase = DefaultGNBCurrencyRatesUseCase(repository: GNBCurrencyRatesRepositorySuccessMock())
        failureUseCase = DefaultGNBCurrencyRatesUseCase(repository: GNBCurrencyRatesRepositoryFailureMock())
    }
    
    override func tearDown() {
        succesUseCase = nil
        failureUseCase = nil
        super.tearDown()
    }
    
    func testGNBCurrencyRatesUseCaseTest_Success() {
        let expectation = expectation(description: "You should get a valid decodable that contains 9 rate conversions and that the from, to, and rate fields are not null for each of them")
        
        succesUseCase?.execute { result in
            switch result {
            case .success(let decodable):
                XCTAssertNotNil(decodable.rates)
                XCTAssertTrue(decodable.rates?.count == 9)
                                
                guard let rates = decodable.rates else {
                    XCTFail("Can not unwrap the rates values")
                    return
                }
                
                for rate in rates {
                    XCTAssertNotNil(rate.from)
                    XCTAssertNotNil(rate.to)
                    XCTAssertNotNil(rate.rate)
                }
                
                expectation.fulfill()
                
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
        }
        
        wait(for: [expectation], timeout: 10)
    }
    
    func testGNBCurrencyRatesUseCaseTest_Failure() {
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
