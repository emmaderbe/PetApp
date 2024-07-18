import UIKit

// MARK: - Properties
class FoodMarkViewCell: UICollectionViewCell {
    private let categoryCellBackground = ImageFactory.imageViewAspectFill(cornerRadius: 16)
    private let categoryCellLabel = LabelFactory.montserratBold16()

// MARK: - init()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
        setupCellConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

// MARK: - setupCell()
private extension FoodMarkViewCell {
    func setupCell() {
        backgroundColor = .accentBackground
        addSubview(categoryCellBackground)
        addSubview(categoryCellLabel)
        categoryCellLabel.textAlignment = .center
    }
}

// MARK: - setupCellConstraints()
private extension FoodMarkViewCell {
    func setupCellConstraints() {
        NSLayoutConstraint.activate([
            categoryCellBackground.topAnchor.constraint(equalTo: topAnchor),
            categoryCellBackground.leadingAnchor.constraint(equalTo: leadingAnchor),
            categoryCellBackground.trailingAnchor.constraint(equalTo: trailingAnchor),
            categoryCellBackground.bottomAnchor.constraint(equalTo: bottomAnchor),

            categoryCellLabel.centerXAnchor.constraint(equalTo: categoryCellBackground.centerXAnchor),
            categoryCellLabel.centerYAnchor.constraint(equalTo: categoryCellBackground.centerYAnchor),
        ])
    }
}

extension FoodMarkViewCell {
    func setupData(image: String, label: String) {
        categoryCellBackground.image = UIImage(named: image)
        categoryCellLabel.text = label
    }
}
