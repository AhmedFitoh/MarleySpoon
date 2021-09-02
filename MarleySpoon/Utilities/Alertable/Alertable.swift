//
//  Alertable.swift
//  MarleySpoon
//
//  Created by AhmedFitoh on 9/1/21.
//

import UIKit


protocol Alertable {
    func showAlert(message: String, completionHandler: (()->())?)
}

extension Alertable where Self: UIViewController {
    func showAlert(message: String, completionHandler: (()->())?){
        let alertController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Common_Ok".localized, style: .default) { _ in
            completionHandler?()
        }
        alertController.addAction(okAction)
        self.present(alertController, animated: true)
    }
}
