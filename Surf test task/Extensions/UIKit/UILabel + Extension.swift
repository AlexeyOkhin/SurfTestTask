//
//  UILabel.swift
//  Surf test task
//
//  Created by Djinsolobzik on 07.02.2023.
//

import UIKit

extension UILabel {
    convenience init(name: String, font: UIFont? = .systemFont(ofSize: 14), textColor: UIColor? = .black) {
        self.init()
        self.text = name
        self.font = font
        self.textColor = textColor
    }
}
