//
//  GNBProductTransactionCell.swift
//  GoliathNationalBankTrades
//
//  Created by Jorge Aracil Gomez on 26/1/23.
//

import UIKit

// MARK: GNBProductTransactionCell

final class GNBProductTransactionCell: UITableViewCell {
    
    private var model: GNBTransactionCurrencyConversionModel?
    
    private (set) var originalValueLabel: UILabel = {
        let originalValueLabel = UILabel(frame: .zero)
        originalValueLabel.translatesAutoresizingMaskIntoConstraints = false
        originalValueLabel.numberOfLines = Constants.labelsNumberOfLines
        return originalValueLabel
    }()
    
    private (set) var transactionIcon: UIImageView = {
        let transactionIcon = UIImageView(frame: .zero)
        transactionIcon.translatesAutoresizingMaskIntoConstraints = false
        return transactionIcon
    }()
    
    private (set) var convertedValueLabel: UILabel = {
        let convertedValueLabel = UILabel(frame: .zero)
        convertedValueLabel.translatesAutoresizingMaskIntoConstraints = false
        convertedValueLabel.numberOfLines = Constants.labelsNumberOfLines
        return convertedValueLabel
    }()
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.originalValueLabel.text = nil
        self.convertedValueLabel.text = nil
    }
}

// MARK: GNBProductTransactionCell - Public Methods

extension GNBProductTransactionCell {
    
    func configure(withModel model: GNBTransactionCurrencyConversionModel) {
        self.model = model
        setupView()
    }
}

// MARK: GNBProductSelectorCell - SetupView

extension GNBProductTransactionCell {
    
    private func setupView() {
        self.backgroundColor = .clear
        setupOriginalValueLabel()
        setupTransactionIconView()
        setupConvertedValueLabel()
    }
    
    private func setupOriginalValueLabel() {
        guard let model = model else { return }
        addSubview(originalValueLabel)
        originalValueLabel.textAlignment = .left
        originalValueLabel.textColor = .black
        originalValueLabel.font = Fonts.primaryLabel
        originalValueLabel.text = model.originalValue
        originalValueLabel.accessibilityIdentifier = AccessibilityIdentifiers.originalValueLabel
        setupOriginalValueLabelConstraints()
    }
    
    private func setupTransactionIconView() {
        addSubview(transactionIcon)
        transactionIcon.image = Images.transactionIcon
        transactionIcon.tintColor = .darkGray
        transactionIcon.accessibilityIdentifier = AccessibilityIdentifiers.transactionIcon
        setupTransactionIconViewConstraints()
    }
    
    private func setupConvertedValueLabel() {
        guard let model = model else { return }
        addSubview(convertedValueLabel)
        convertedValueLabel.textAlignment = .right
        convertedValueLabel.textColor = .black
        convertedValueLabel.font = Fonts.primaryLabel
        convertedValueLabel.text = model.convertedValue
        convertedValueLabel.accessibilityIdentifier = AccessibilityIdentifiers.convertedValueLabel
        setupConvertedValueLabelConstraints()
    }
}
