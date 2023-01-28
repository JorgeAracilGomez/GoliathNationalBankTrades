//
//  GNBHappyPath+UITest.swift
//  GoliathNationalBankTradesUITests
//
//  Created by Jorge Aracil Gomez on 28/1/23.
//

import XCTest
@testable import GoliathNationalBankTrades

final class GNBHappyPathUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }
    
    func testUIHappyPathViews() throws {
        
        let app = XCUIApplication()
        app.launch()
        
        // MARK: Product Selection View Assertions
        
        let productSelectionViewExpectation = expectation(description: "When the product selection screen has loaded, it should have a navigation bar containing a title, a product table where there should be the same number of cell components as there are cells in the table.")
        
        let productSelectionNavigationBarTitle = app.navigationBars.children(matching: .staticText).firstMatch
        XCTAssert(productSelectionNavigationBarTitle.waitForExistence(timeout: 5.0))
        
        let productsTable = app.tables["GNBProductsTableView"]
        let numberOfCellsInProductsTableView = productsTable.cells.count
        let numberOfTransactionIconInProductsCells = app.images.matching(identifier: "GNBProductSelectorCellTransactionIcon").count
        let numberOfTitleLabelInProductsCells = app.staticTexts.matching(identifier: "GNBProductSelectorCellTitleLabel").count
        let numberOfSubtitleLabelInProductsCells = app.staticTexts.matching(identifier: "GNBProductSelectorCellSubitleLabel").count
        let numberOfSelectorIconInProductsCells = app.images.matching(identifier: "GNBProductSelectorCellShowDetailIcon").count
        
        XCTAssert(productsTable.exists)
        XCTAssertEqual(numberOfCellsInProductsTableView, numberOfTransactionIconInProductsCells)
        XCTAssertEqual(numberOfCellsInProductsTableView, numberOfTitleLabelInProductsCells)
        XCTAssertEqual(numberOfCellsInProductsTableView, numberOfSubtitleLabelInProductsCells)
        XCTAssertEqual(numberOfCellsInProductsTableView, numberOfSelectorIconInProductsCells)
        
        productSelectionViewExpectation.fulfill()
        
        
        // MARK: Product Cell Assertions
        
        let topProductCellExpectation = expectation(description: "For a given cell, it must exist in the view and contain the right image, the title and subtitle, and the icon to select the product.")
        
        let topProductCell = productsTable.cells.firstMatch
        let topProductCellRightIcon = topProductCell.images["GNBProductSelectorCellTransactionIcon"]
        let topProductCellTitleLabel = topProductCell.staticTexts.matching(identifier: "GNBProductSelectorCellTitleLabel").firstMatch
        let topProductCellSubtitleLabel = topProductCell.staticTexts.matching(identifier: "GNBProductSelectorCellSubitleLabel").firstMatch
        let topProductCellLeftIcon = topProductCell.images["GNBProductSelectorCellShowDetailIcon"]
        
        XCTAssert(topProductCell.exists)
        XCTAssert(topProductCellRightIcon.exists)
        XCTAssert(topProductCellTitleLabel.exists)
        XCTAssert(topProductCellSubtitleLabel.exists)
        XCTAssert(topProductCellLeftIcon.exists)
        
        topProductCellExpectation.fulfill()
        
        
        // MARK: Product Detail View Assertions
        
        let productDetailViewExpectation = expectation(description: "When the product detail screen has loaded, it should have a navigation bar containing a title, two labels showing both the product name and the total balance, and a product table where there should be the same number of product components. the cell that of cells in the table.")
        
        topProductCell.tap()
        
        let productDetailNavigationBarTitle = app.navigationBars.children(matching: .staticText).firstMatch
        XCTAssert(productDetailNavigationBarTitle.exists)
        
        let productDetailNameLabel = app.staticTexts.matching(identifier: "GNBProductDetailBalanceViewNameLabel").firstMatch
        let productDetailTotalBalenceLabel = app.staticTexts.matching(identifier: "GNBProductDetailBalanceViewBalanceLabel").firstMatch
        XCTAssert(productDetailNameLabel.exists)
        XCTAssert(productDetailTotalBalenceLabel.exists)

        let transactionsTable = app.tables["GNBTransactionsTableView"]
        let numberOfCellsInTransactionsTableView = transactionsTable.cells.count
        let numberOfOriginalLabelInTransactionsCells = app.staticTexts.matching(identifier: "GNBProductTransactionCellOriginalValueLabel").count
        let numberOfTransactionIconInTransactionsCells = app.images.matching(identifier: "GNBProductTransactionCellIcon").count
        let numberOfConvertedLabelInTransactionsCells = app.staticTexts.matching(identifier: "GNBProductTransactionCellConvertedValueLabel").count
        XCTAssert(transactionsTable.waitForExistence(timeout: 5.0))
        XCTAssertEqual(numberOfCellsInTransactionsTableView, numberOfOriginalLabelInTransactionsCells)
        XCTAssertEqual(numberOfCellsInTransactionsTableView, numberOfTransactionIconInTransactionsCells)
        XCTAssertEqual(numberOfCellsInTransactionsTableView, numberOfConvertedLabelInTransactionsCells)
        
        productDetailViewExpectation.fulfill()
        
        
        // MARK: Transaction Cell Assertions

        let topTransactionCellExpectation = expectation(description: "For a given cell, it must exist in the view and contain the left and right labels, as well as the center icon.")
        
        let topTransactionCell = transactionsTable.cells.firstMatch
        let topTransactionCellOriginalLabel = topTransactionCell.staticTexts.matching(identifier: "GNBProductTransactionCellOriginalValueLabel").firstMatch
        let topTransactionCellIcon = topTransactionCell.images["GNBProductTransactionCellIcon"]
        let topTransactionCellConvertedLabel = topTransactionCell.staticTexts.matching(identifier: "GNBProductTransactionCellConvertedValueLabel").firstMatch
        
        XCTAssert(topTransactionCell.exists)
        XCTAssert(topTransactionCellOriginalLabel.exists)
        XCTAssert(topTransactionCellIcon.exists)
        XCTAssert(topTransactionCellConvertedLabel.exists)
        
        topTransactionCellExpectation.fulfill()
        
        wait(for: [productSelectionViewExpectation, topProductCellExpectation, productDetailViewExpectation, topTransactionCellExpectation], timeout: 20)
    }
}
