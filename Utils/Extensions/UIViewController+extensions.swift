//
//  UIViewController+extensions.swift
//  testSantander
//
//  Created by Paulo Lazarini on 08/08/22.
//

import UIKit

extension UIViewController {
    func presentAlert(message: String) {
        let alertController = UIAlertController(title: "Erro de formulário", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default)
        alertController.addAction(okAction)
        
        present(alertController, animated: true)
    }
}
