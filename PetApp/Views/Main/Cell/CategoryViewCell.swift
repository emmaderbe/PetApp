import UIKit

// MARK: - Properties
class CategoryViewCell: UICollectionViewCell {

    lazy var  categoryCellImage: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 12
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    lazy var  categoryCellLabel: UILabel = {
        let label = UILabel()
        label.font = .montserratSemiBold12()
        label.textColor = .accentText
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let stackCell: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 8
        stack.alignment = .center
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
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
extension CategoryViewCell {
    func setupCell() {
        backgroundColor = .accentBackground
        addSubview(stackCell)
        stackCell.addArrangedSubview(categoryCellImage)
        stackCell.addArrangedSubview(categoryCellLabel)
    }
}

// MARK: - setupCellConstraints()
extension CategoryViewCell {
    func setupCellConstraints() {
        
        NSLayoutConstraint.activate([
            stackCell.topAnchor.constraint(equalTo: topAnchor),
            stackCell.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackCell.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackCell.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            categoryCellImage.widthAnchor.constraint(equalToConstant: ViewConstraintsConstants.CategoryViewConstraints.imageWidth),
            categoryCellImage.heightAnchor.constraint(equalTo: categoryCellImage.widthAnchor),
            
            categoryCellLabel.heightAnchor.constraint(equalToConstant: ViewConstraintsConstants.CategoryViewConstraints.labelHeight),
        ])
    }
}
