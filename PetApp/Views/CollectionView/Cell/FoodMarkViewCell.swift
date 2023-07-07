import UIKit

// MARK: - Properties
class FoodMarkViewCell: UICollectionViewCell {

    lazy var categoryCellBackground: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 16
        image.clipsToBounds = true
        image.backgroundColor = .accentGrey
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    lazy var categoryCellLabel: UILabel = {
        let label = UILabel()
        label.font = .montserratSemiBold16()
        label.textColor = .accentText
        label.textAlignment = .center
        label.text = "Можно"
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

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
extension FoodMarkViewCell {
    func setupCell() {
        backgroundColor = .accentBackground
        addSubview(categoryCellBackground)
        addSubview(categoryCellLabel)
    }
}

// MARK: - setupCellConstraints()
extension FoodMarkViewCell {
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
