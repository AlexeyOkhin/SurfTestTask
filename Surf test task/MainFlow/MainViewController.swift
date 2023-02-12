//
//  ViewController.swift
//  Surf test task
//
//  Created by Djinsolobzik on 02.02.2023.
//

import UIKit

final class MainViewController: UICollectionViewController {
    //MARK: - Properties

    //MARK: - Private Properties

    private var collectionViewTopConstraint: NSLayoutConstraint?
    private var collectionViewTopConstraintMin: CGFloat = 60.0
    private lazy var collectionViewTopConstraintMax: CGFloat = topViewHeight - 32

    private let topViewHeight = UIScreen.main.bounds.width

    private let topView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "MainBackGround")
        return imageView
    }()

    private let textLabel = UILabel(
                                    name: "Хочешь к нам?",
                                    font: Resources.Font.descriptionText,
                                    textColor: Resources.Color.descriptionText)

    private let sendButton = UIButton(
                                    title: "Отправить заявку",
                                    backgroundCollor: Resources.Color.buttonSend,
                                    titleColor: .white,
                                    cornerRadius: 30)

    init() {
        super.init(collectionViewLayout: UICollectionViewLayout())
        commonInit()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //MARK: - Lifi Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setElements()
    }
    //MARK: - Methods

    //MARK: - Private Methods

}

//MARK: - Private Extensions

private extension MainViewController {

    private func commonInit() {

        view.backgroundColor = .white

        collectionView.backgroundColor = .white
        collectionView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        collectionView.layer.cornerRadius = 32
        collectionView.clipsToBounds = true

        view.addSubview(topView)
        view.bringSubviewToFront(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false


        NSLayoutConstraint.activate([
            topView.topAnchor.constraint(equalTo: view.topAnchor),
            topView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topView.trailingAnchor.constraint(equalTo: view.trailingAnchor),

            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])

        let bottomView = ButtonFormView(label: textLabel, button: sendButton)
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bottomView)

        NSLayoutConstraint.activate([
            bottomView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bottomView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bottomView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            bottomView.heightAnchor.constraint(equalToConstant: 160)
        ])

        collectionViewTopConstraint = collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: collectionViewTopConstraintMax)
        collectionViewTopConstraint?.isActive = true
    }

    func setElements() {
        sendButton.addTarget(self, action: #selector(sendMessage), for: .touchUpInside)
    }

    @objc func sendMessage() {
        showAlert(title: "Поздравляем!", message: "Ваша заявка успешно отправлена!")
    }
}
