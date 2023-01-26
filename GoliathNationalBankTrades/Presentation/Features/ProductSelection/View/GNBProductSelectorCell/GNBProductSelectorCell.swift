//
//  GNBProductSelectorCell.swift
//  GoliathNationalBankTrades
//
//  Created by Jorge Aracil Gomez on 25/1/23.
//

import UIKit

// MARK: GNBProductSelectorCell

final class GNBProductSelectorCell: UITableViewCell {
    
    private var productTitle: String?
    private var transactionsNumber: Int?
    
    private (set) var shadowView: UIView = {
        let shadowView = UIView(frame: .zero)
        shadowView.translatesAutoresizingMaskIntoConstraints = false
        return shadowView
    }()
    
    private (set) var transactionIcon: UIImageView = {
        let transactionIcon = UIImageView(frame: .zero)
        transactionIcon.translatesAutoresizingMaskIntoConstraints = false
        return transactionIcon
    }()
    
    private (set) var titleLabel: UILabel = {
        let titleLabel = UILabel(frame: .zero)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.numberOfLines = Constants.labelsNumberOfLines
        return titleLabel
    }()
    
    private (set) var subtitleLabel: UILabel = {
        let subtitleLabel = UILabel(frame: .zero)
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.numberOfLines = Constants.labelsNumberOfLines
        return subtitleLabel
    }()
    
    private (set) var showDetailIcon: UIImageView = {
        let showDetailIcon = UIImageView(frame: .zero)
        showDetailIcon.translatesAutoresizingMaskIntoConstraints = false
        return showDetailIcon
    }()
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.titleLabel.text = nil
    }
}

// MARK: GNBProductSelectorCell - Public Methods

extension GNBProductSelectorCell {
    
    func configure(withTitle title: String, andTransactionsNumber transactionsNumber: Int) {
        self.productTitle = title
        self.transactionsNumber = transactionsNumber
        setupView()
    }
}

// MARK: GNBProductSelectorCell - SetupView

extension GNBProductSelectorCell {
    
    private func setupView() {
        self.backgroundColor = .clear
        setupShadowView()
        setupTransactionIconView()
        setupTitleLabel()
        setupSubtitleLabel()
        setupShowDetailIconView()
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
    
    private func setupTransactionIconView() {
        addSubview(transactionIcon)
        transactionIcon.image = Images.transactionIcon
        transactionIcon.tintColor = .darkGray
        setupTransactionIconViewConstraints()
    }
    
    private func setupTitleLabel() {
        guard let text = productTitle else { return }
        addSubview(titleLabel)
        titleLabel.textAlignment = .left
        titleLabel.textColor = .black
        titleLabel.font = Fonts.titleLabel
        titleLabel.text = text
        setupTitleLabelConstraints()
    }
    
    private func setupSubtitleLabel() {
        guard let number = transactionsNumber else { return }
        addSubview(subtitleLabel)
        subtitleLabel.textAlignment = .left
        subtitleLabel.textColor = .darkGray
        subtitleLabel.font = Fonts.subtitleLabel
        subtitleLabel.text = Localizables.subtitleLabel.replacingOccurrences(
            of: Constants.replacingLabelString,
            with: String(number))
        setupSubtitleLabelConstraints()
    }
    
    private func setupShowDetailIconView() {
        addSubview(showDetailIcon)
        showDetailIcon.image = Images.chevronIcon
        showDetailIcon.tintColor = .darkGray
        setupShowDetailIconViewConstraints()
    }
}
