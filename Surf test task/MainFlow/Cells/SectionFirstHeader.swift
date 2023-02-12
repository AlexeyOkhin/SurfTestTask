//
//  SectionFirstHeader.swift
//  Surf test task
//
//  Created by Djinsolobzik on 12.02.2023.
//

import UIKit

final class SectionFirstHeader: UICollectionReusableView {

    static let idenifire = "\(SectionFirstHeader.self)"

    lazy var title: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = Resources.Color.titleText
        label.textAlignment = .left
        label.font = Resources.Font.titleText
        return label
    }()

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

        addSubview(title)
        addSubview(subTitle)

        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: topAnchor, constant: 24),
            title.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            title.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -0),

            subTitle.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 16),
            subTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            subTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -0),
            subTitle.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -0)
        ])

    }

}
