//
//  UpLineCell.swift
//  Surf test task
//
//  Created by Djinsolobzik on 08.02.2023.
//

import UIKit

final class UpLineCell: UICollectionViewCell {

    static let idenifire = "\(UpLineCell.self)"

    var didThemeTapped: (() -> Void)?

    override var isSelected: Bool {
        didSet {
            updateCell()
            didThemeTapped?()
        }
    }

    override var isHighlighted: Bool {
        didSet { bounce(isHighlighted) }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureCell()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }

    private lazy var mainContainer = UIView()

    private lazy var labelTitle: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.font = Resources.Font.buttonText
        label.textColor = Resources.Color.buttonSend
        return label
    }()

    private func configureCell() {
        mainContainer.clipsToBounds = true
        mainContainer.layer.cornerRadius = 12
        mainContainer.backgroundColor = Resources.Color.cellDisableColor

        makeConstraint()
        updateCell()
    }

    private func makeConstraint() {

        contentView.addSubview(mainContainer)
        mainContainer.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            mainContainer.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            mainContainer.topAnchor.constraint(equalTo: contentView.topAnchor),
            mainContainer.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            mainContainer.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])

        mainContainer.addSubview(labelTitle)
        labelTitle.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            labelTitle.leadingAnchor.constraint(equalTo: mainContainer.leadingAnchor, constant: 8),
            labelTitle.centerYAnchor.constraint(equalTo: mainContainer.centerYAnchor),
            labelTitle.trailingAnchor.constraint(equalTo: mainContainer.trailingAnchor, constant: -8)
        ])
    }

    private func updateCell() {

        UIView.animate(withDuration: 0.4) {
            self.mainContainer.backgroundColor = self.isSelected ? Resources.Color.cellDisableColor : Resources.Color.cellEnableColor
            self.labelTitle.textColor = self.isSelected ? Resources.Color.buttonSend : .white

        }
    }

    private func bounce(_ bounce: Bool) {
        UIView.animate(
            withDuration: 0.8,
            delay: 0,
            usingSpringWithDamping: 0.4,
            initialSpringVelocity: 0.8,
            options: [.allowUserInteraction, .beginFromCurrentState],
            animations: { self.transform = bounce ? CGAffineTransform(scaleX: 0.9, y: 0.9) : .identity },
            completion: nil)
    }

    func configure(model: VacancyModel) {
        labelTitle.text = model.name
    }

}

