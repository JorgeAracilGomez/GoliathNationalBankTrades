//
//  GNBSpinnerViewController.swift
//  GoliathNationalBankTrades
//
//  Created by Jorge Aracil Gomez on 26/1/23.
//

import UIKit

// MARK: GNBSpinnerViewController

final class GNBSpinnerViewController: UIViewController {
    
    private (set) var spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.large)
        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.color = .white
        spinner.startAnimating()
        return spinner
    }()
    
    override func loadView() {
        setupView()
    }
}

// MARK: Setup View

extension GNBSpinnerViewController {
    
    private func setupView() {
        setupBackgroundView()
        setupSpinnerView()
    }
    
    private func setupBackgroundView() {
        view = UIView()
        view.backgroundColor = Colors.background
    }
    
    private func setupSpinnerView() {
        view.addSubview(spinner)
        setupSpinnerViewConstraints()
    }
}
