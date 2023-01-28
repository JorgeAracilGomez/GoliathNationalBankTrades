//
//  GNBProductDetailBalanceView.swift
//  GoliathNationalBankTrades
//
//  Created by Jorge Aracil Gomez on 26/1/23.
//

import UIKit

// MARK: GNBProductDetailBalanceView

final class GNBProductDetailBalanceView: UIView {
    
    private var productName: String = ""
    private var totalBalance: String = ""
    
    private (set) var shadowView: UIView = {
        let shadowView = UIView(frame: .zero)
        shadowView.translatesAutoresizingMaskIntoConstraints = false
        return shadowView
    }()
    
    private (set) var productNameLabel: UILabel = {
        let productNameLabel = UILabel(frame: .zero)
        productNameLabel.translatesAutoresizingMaskIntoConstraints = false
        productNameLabel.numberOfLines = Constants.labelsNumberOfLines
        return productNameLabel
    }()
    
    private (set) var totalBalanceLabel: UILabel = {
        let totalBalanceLabel = UILabel(frame: .zero)
        totalBalanceLabel.translatesAutoresizingMaskIntoConstraints = false
        totalBalanceLabel.numberOfLines = Constants.labelsNumberOfLines
        return totalBalanceLabel
    }()
}

// MARK: Public Methods

extension GNBProductDetailBalanceView {
    
    public func configure(withProductName productName: String, withTotalBalance totalBalance: String) {
        self.productName = productName
        self.totalBalance = totalBalance
        setupView()
    }
}

// MARK: Setup View

extension GNBProductDetailBalanceView {
    
    private func setupView() {
        setupShadowView()
        setupProductNameLabel()
        setupTotalBalanceLabel()
    }
    
    private func setupShadowView() {
        addSubview(shadowView)
        shadowView.backgroundColor = .white
        shadowView.layer.cornerRadius = Constants.shadowViewCornerRadius
        shadowView.layer.shadowColor = UIColor.darkGray.cgColor
        shadowView.layer.shadowOffset = Constants.shadowViewOffset
        shadowView.layer.shadowRadius = Constants.shadowViewRadius
        shadowView.layer.shadowOpacity = Constants.shadowViewOpacity
        setupShadowViewConstraints()
    }
    
    private func setupProductNameLabel() {
        shadowView.addSubview(productNameLabel)
        productNameLabel.textAlignment = .left
        productNameLabel.textColor = .darkGray
        productNameLabel.font = Fonts.primaryLabel
        productNameLabel.text = productName
        productNameLabel.accessibilityIdentifier = AccessibilityIdentifiers.productNameLabel//"GNBProductDetailBalanceViewNameLabel" // MISCO
        setupProductNameLabelConstraints()
    }
    
    private func setupTotalBalanceLabel() {
        shadowView.addSubview(totalBalanceLabel)
        totalBalanceLabel.textAlignment = .left
        totalBalanceLabel.textColor = .darkGray
        totalBalanceLabel.font = Fonts.primaryLabel
        totalBalanceLabel.text = String(format: Localizables.balanceLabel, arguments: [totalBalance])
        totalBalanceLabel.accessibilityIdentifier = AccessibilityIdentifiers.totalBalanceLabel//"GNBProductDetailBalanceViewBalanceLabel" // MISCO
        setupTotalBalanceLabelConstraints()
    }
}
