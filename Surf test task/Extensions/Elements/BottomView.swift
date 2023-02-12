//
//  BottomView.swift
//  Surf test task
//
//  Created by Djinsolobzik on 08.02.2023.
//

import UIKit

class ButtonFormView: UIView {

    init(label: UILabel, button: UIButton) {
        super.init(frame: .zero)
        self.backgroundColor = .white
        translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false

        addSubview(label)
        addSubview(button)

        NSLayoutConstraint.activate([
            label.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20)
        ])

        NSLayoutConstraint.activate([
            button.leadingAnchor.constraint(equalTo: label.trailingAnchor, constant: 20),
            button.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            button.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            //widthAnchor.constraint(equalToConstant: 120),
            button.heightAnchor.constraint(equalToConstant: 60)
        ])

        //bottomAnchor.constraint(equalTo: button.bottomAnchor).isActive = true
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
