//
//  SectionSecondHeader.swift
//  Surf test task
//
//  Created by Djinsolobzik on 12.02.2023.
//

import UIKit

final class SectionSecondHeader: UICollectionReusableView {

    static let idenifire = "\(SectionSecondHeader.self)"

    lazy var subTitle: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = Resources.Color.descriptionText
        label.numberOfLines = 0
        label.textAlignment = .left
        label.font = Resources.Font.descriptionText
        return label
    }()

    override public init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func commonInit() {

        backgroundColor = .clear
        layer.cornerRadius = 7.0

        addSubview(subTitle)

        NSLayoutConstraint.activate([
            subTitle.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            subTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            subTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -0),
            subTitle.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -0)
        ])

    }
}
