//
//  UIViewController + Extension.swift
//  Surf test task
//
//  Created by Djinsolobzik on 12.02.2023.
//

import UIKit

extension UIViewController {
    func showAlert(title: String, message: String, completion: ((UIAlertAction) -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Закрыть", style: .default, handler: completion))
        self.present(alert, animated: true)
    }
}
