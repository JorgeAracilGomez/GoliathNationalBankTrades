//
//  UIView+SafeAnchor.swift
//  GoliathNationalBankTrades
//
//  Created by Jorge Aracil Gomez on 26/1/23.
//

import UIKit

/// This extension controls the margins of the UIView depending on whether or not it accepts safeAreaLayoutGuide
extension UIView {
  
    /// This method returns the top margin based on whether or not the device accepts the safeAreaLayoutGuide
    var safeTopAnchor: NSLayoutYAxisAnchor {
        if #available(iOS 11.0, *) {
            return self.safeAreaLayoutGuide.topAnchor
        } else {
            return self.topAnchor
        }
    }

    /// This method returns the bottom margin based on whether or not the device accepts the safeAreaLayoutGuide
    var safeBottomAnchor: NSLayoutYAxisAnchor {
        if #available(iOS 11.0, *) {
          return self.safeAreaLayoutGuide.bottomAnchor
        } else {
            return self.bottomAnchor
        }
      }
}
