//
//  ViewController.swift
//  Surf test task
//
//  Created by Djinsolobzik on 02.02.2023.
//

import UIKit

final class MainViewController: UICollectionViewController {

    //MARK: - Private Properties

    private let vacancyListUp = VacancyModel.sampleData
    private let vacancyListDown = VacancyModel.sampleData
    private var sections = [[VacancyModel]]()
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
        createSectionsData()
        setElements()
    }
}

//MARK: - Methods Layout

extension MainViewController {

    func configureCompositionalLayout() -> UICollectionViewCompositionalLayout {
        let layout = UICollectionViewCompositionalLayout(sectionProvider: { [weak self] sectionId, enviroment in
            switch sectionId {
            case 0: return self?.createSectionLayout1(enviroment: enviroment)
            default: return self?.createSectionLayout2(enviroment: enviroment)
            }
        })

        return layout
    }

    func createSectionLayout1(enviroment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .estimated(1.0), heightDimension: .estimated(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(widthDimension: .estimated(1.0), heightDimension: .estimated(1.0))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])

        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous

        section.contentInsets = .init(top: 16, leading: 16, bottom: 16, trailing: 16)
        section.interGroupSpacing = 8

        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(1.0))
        let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: "SectionFirstHeader", alignment: .top)

        section.boundarySupplementaryItems = [header]

        return section
    }

    func createSectionLayout2(enviroment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .estimated(1.0), heightDimension: .estimated(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(1.0))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])

        group.interItemSpacing = .fixed(8)

        let section = NSCollectionLayoutSection(group: group)


        section.contentInsets = .init(top: 16, leading: 16, bottom: 16, trailing: 16)
        section.interGroupSpacing = 8

        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(1.0))
        let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: "SectionSecondHeader", alignment: .top)

        section.boundarySupplementaryItems = [header]

        return section
    }
}

//MARK: - Private Extensions

private extension MainViewController {

    func commonInit() {

        view.backgroundColor = .white

        collectionView.backgroundColor = .white
        collectionView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        collectionView.layer.cornerRadius = 32
        collectionView.clipsToBounds = true

        collectionView.register(UpLineCell.self, forCellWithReuseIdentifier: UpLineCell.idenifire)
        collectionView.register(SectionFirstHeader.self, forSupplementaryViewOfKind: "SectionFirstHeader", withReuseIdentifier: SectionFirstHeader.idenifire)
        collectionView.register(SectionSecondHeader.self, forSupplementaryViewOfKind: "SectionSecondHeader", withReuseIdentifier: SectionSecondHeader.idenifire)

        collectionView.collectionViewLayout = configureCompositionalLayout()

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

    func createSectionsData() {
        sections = [vacancyListUp, vacancyListDown]
    }

    func setElements() {
        sendButton.addTarget(self, action: #selector(sendMessage), for: .touchUpInside)
    }

    @objc func sendMessage() {
        showAlert(title: "Поздравляем!", message: "Ваша заявка успешно отправлена!")
    }
}

//MARK: - UICollectionViewDelegate

extension MainViewController {

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        sections.count
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        sections[section].count
    }

    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {

        if kind == "SectionFirstHeader" {
            let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: SectionFirstHeader.idenifire, for: indexPath)
            (view as? SectionFirstHeader)?.title.text = "Стажировка в Surf"
            (view as? SectionFirstHeader)?.subTitle.text = "Работай над реальными задачами под руководством опытного наставника и получи возможность стать частью команды мечты. "
            return view
        }

        if kind == "SectionSecondHeader" {
            let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: SectionSecondHeader.idenifire, for: indexPath)
            (view as? SectionSecondHeader)?.subTitle.text = "Получай стипендию, выстраивай удобный график, работай на современном железе."
            return view
        }

        return UICollectionReusableView()
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UpLineCell.idenifire, for: indexPath)
        let model = sections[indexPath.section][indexPath.row]

        (cell as? UpLineCell)?.configure(model: model)

        return cell
    }

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            collectionView.moveItem(at: indexPath, to: IndexPath(item: 0, section: 0))
        }

    }

}

//MARK: - Animation

extension MainViewController {

    override func scrollViewDidScroll(_ scrollView: UIScrollView) {

        let offsetY = scrollView.contentOffset.y

        guard let height = collectionViewTopConstraint?.constant else { return }

        if offsetY > 0 {
            collectionViewTopConstraint?.constant = height > collectionViewTopConstraintMin ? height - offsetY : collectionViewTopConstraintMin
        } else if offsetY < 0 {
            collectionViewTopConstraint?.constant = height < collectionViewTopConstraintMax ? height - offsetY : collectionViewTopConstraintMax
        }

    }

    override func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {

        if collectionViewTopConstraint?.constant ?? 0 > collectionViewTopConstraintMax/2 {

            UIView.animate(withDuration: 0.4, delay: 0) { [weak self] in
                self?.collectionViewTopConstraint?.constant = self?.collectionViewTopConstraintMax ?? 0
                self?.view.layoutIfNeeded()
            }

        } else {

            UIView.animate(withDuration: 0.4, delay: 0) { [weak self] in
                self?.collectionViewTopConstraint?.constant = self?.collectionViewTopConstraintMin ?? 0
                self?.view.layoutIfNeeded()
            }

        }
    }
}
