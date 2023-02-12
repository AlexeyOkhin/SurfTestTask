//
//  UIButton + Extension.swift
//  Surf test task
//
//  Created by Djinsolobzik on 07.02.2023.
//

import UIKit

extension UIButton {
    convenience init(title: String,
                    backgroundCollor: UIColor,
                    titleColor: UIColor,
                    cornerRadius: CGFloat,
                    font: UIFont? = .systemFont(ofSize: 18)) {
        self.init(type: .system)
        self.setTitle(title, for: .normal)
        self.setTitleColor(titleColor, for: .normal)
        self.backgroundColor = backgroundCollor
        self.titleLabel?.font = font
        self.layer.cornerRadius = cornerRadius
        self.contentEdgeInsets = .init(top: 20, left: 40, bottom: 20, right: 40)
    }
}
