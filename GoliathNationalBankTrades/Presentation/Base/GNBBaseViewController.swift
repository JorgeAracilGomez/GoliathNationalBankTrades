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

// MARK: Mannage Alert Dialogs

extension GNBBaseViewController {
 
    func showAlert(error: GNBError?) {
        
        let alertTitle = "Ha ocurrido un error"
        let alertDescription = "Por favor vuelve a itentarlo en unos momentos."
        let alertButtonText = "Aceptar"
        let alertController = UIAlertController(title: alertTitle, message: alertDescription, preferredStyle: .alert)
        let action = UIAlertAction(title: alertButtonText, style: .default)
        alertController.addAction(action)

        DispatchQueue.main.async {
            self.present(alertController, animated: true)
        }
    }
}
