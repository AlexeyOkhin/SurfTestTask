//
//  Resources.swift
//  Surf test task
//
//  Created by Djinsolobzik on 07.02.2023.
//

import UIKit

enum Resources {
    enum Color {
        static var titleText = UIColor(hexString: "313131")
        static var descriptionText = UIColor(hexString: "96959B")
        static let buttonSend = UIColor(hexString: "313131")
    }

    enum Font {
        static var titleText = UIFont.systemFont(ofSize: 24, weight: .medium)
        static var buttonText = UIFont.systemFont(ofSize: 16, weight: .medium)
        static var descriptionText = UIFont.systemFont(ofSize: 14, weight: .light)
    }
}
