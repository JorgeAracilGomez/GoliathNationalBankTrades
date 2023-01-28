//
//  MainCoordinator.swift
//  GoliathNationalBankTrades
//
//  Created by Jorge Aracil Gomez on 26/1/23.
//

import Foundation
import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
}

final class MainCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
}

// MARK: Show aplication entry point

extension MainCoordinator {
    
    /// This method is responsible for initializing the application.
    func start() {
        let productSelectionViewController = GNBProductSelectionViewController()
        productSelectionViewController.coordinator = self
        navigationController.pushViewController(productSelectionViewController, animated: false)
    }
    
    /// This method navigates to the Product detail screen.
    /// - Parameter model: Model that contains the information of the product for which you want to obtain the detail view.
    func showProductDetail(withModel model: GNBProductSelectionModel) {
        let productDetailViewController = GNBProductDetailViewController(inputModel: model)
        productDetailViewController.coordinator = self
        navigationController.pushViewController(productDetailViewController, animated: true)
    }
    
    /// This method shows an error popup of type Alert
    /// - Parameter error: Model of the error that has occurred
    func showAlert(error: GNBError?) {
        let alertTitle = "An error has occurred"
        let alertDescription = "Please try again in a few moments."
        let alertButtonText = "Accept"
        let alertController = UIAlertController(title: alertTitle, message: alertDescription, preferredStyle: .alert)
        let action = UIAlertAction(title: alertButtonText, style: .default)
        alertController.addAction(action)
        navigationController.present(alertController, animated: true)
    }
}
