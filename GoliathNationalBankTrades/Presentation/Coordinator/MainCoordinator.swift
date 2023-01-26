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
    
    func start() {
        let productSelectionViewController = GNBProductSelectionViewController()
        productSelectionViewController.coordinator = self
        navigationController.pushViewController(productSelectionViewController, animated: false)
    }
}
