//
//  GNBBaseViewController.swift
//  GoliathNationalBankTrades
//
//  Created by Jorge Aracil Gomez on 26/1/23.
//

import UIKit

// MARK: GNBBaseViewController

class GNBBaseViewController: UIViewController {
    
    let child = GNBSpinnerViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: Mannage Spinner

extension GNBBaseViewController {
    
    func showSpinner() {
        addChild(child)
        child.view.frame = view.frame
        view.addSubview(child.view)
        child.didMove(toParent: self)
    }
    
    func hideSpinner() {
        DispatchQueue.main.async {
            self.child.willMove(toParent: nil)
            self.child.view.removeFromSuperview()
            self.child.removeFromParent()
        }
    }
}
