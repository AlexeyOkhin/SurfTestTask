//
//  ViewController.swift
//  Surf test task
//
//  Created by Djinsolobzik on 02.02.2023.
//

import UIKit

final class MainViewController: UIViewController {
    //MARK: - Properties

    //MARK: - Private Properties

    private let backImageView: UIImageView = {
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

    //MARK: - Lifi Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setConstreints()
    }
    //MARK: - Methods

    //MARK: - Private Methods

    
}


//MARK: - Private Extensions

private extension MainViewController {

    func setConstreints() {
        view.addSubview(backImageView)
        backImageView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            backImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backImageView.heightAnchor.constraint(equalToConstant: view.bounds.height / 1.4)
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
    }
}
