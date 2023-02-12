//
//  UpLineCell.swift
//  Surf test task
//
//  Created by Djinsolobzik on 08.02.2023.
//

import UIKit

final class UpLineCell: UICollectionViewCell {

    static let idenifire = "\(UpLineCell.self)"

    override var isSelected: Bool {
        didSet {
            if isSelectedCell {
                isSelectedCell = false
            } else {
                isSelectedCell = isSelected
            }
        }
    }

    private var isSelectedCell: Bool = false {
        didSet {
            updateCell()
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
        label.font = Resources.Font.titleCellText
        label.textColor = Resources.Color.buttonSend
        return label
    }()

    override func prepareForReuse() {
        super.prepareForReuse()
        labelTitle.text = nil
        mainContainer.backgroundColor = Resources.Color.cellDisableColor
    }

    private func configureCell() {
        mainContainer.clipsToBounds = true
        mainContainer.layer.cornerRadius = 12
        mainContainer.backgroundColor = Resources.Color.cellDisableColor
        makeConstraint()
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
            labelTitle.topAnchor.constraint(equalTo: mainContainer.topAnchor, constant: 8),
            labelTitle.leadingAnchor.constraint(equalTo: mainContainer.leadingAnchor, constant: 18),
            labelTitle.trailingAnchor.constraint(equalTo: mainContainer.trailingAnchor, constant: -18),
            labelTitle.bottomAnchor.constraint(equalTo: mainContainer.bottomAnchor, constant: -8)
        ])

        for i in 0..<contentView.constraints.count {
           contentView.constraints[i].priority = .init(999)
        }
    }

    private func updateCell() {

        UIView.animate(withDuration: 0.4) {

            self.mainContainer.backgroundColor = self.isSelectedCell ? Resources.Color.cellEnableColor : Resources.Color.cellDisableColor
            self.labelTitle.textColor = self.isSelectedCell ? .white : Resources.Color.buttonSend
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

