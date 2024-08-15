import UIKit

// MARK: - Properties
final class CategoryViewCell: UICollectionViewCell {
    private let categoryCellImage = ImageFactory.imageViewAspectFill(cornerRadius: 12)
    private let categoryCellLabel = LabelFactory.montserratSemiBold12()
    private let stackCell = StackFactory.verticalStackView(spacing: 8)
    
    // MARK: - init()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
        setupCellConstraints()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - setupCell()
private extension CategoryViewCell {
    func setupCell() {
        backgroundColor = .accentBackground
        addSubview(stackCell)
        stackCell.addArrangedSubview(categoryCellImage)
        stackCell.addArrangedSubview(categoryCellLabel)
        
        stackCell.alignment = .center
    }
}

// MARK: - setupCellConstraints()
private extension CategoryViewCell {
    func setupCellConstraints() {
        NSLayoutConstraint.activate([
            stackCell.topAnchor.constraint(equalTo: topAnchor, constant: ViewConstants.CategoryViewConstraints.generalTop),
            stackCell.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackCell.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackCell.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            categoryCellImage.widthAnchor.constraint(equalToConstant: ViewConstants.CategoryViewConstraints.imageWidth),
            categoryCellImage.heightAnchor.constraint(equalTo: categoryCellImage.widthAnchor),
            
            categoryCellLabel.heightAnchor.constraint(equalToConstant: ViewConstants.CategoryViewConstraints.labelHeight),
        ])
    }
}

extension CategoryViewCell {
    func setupCell(image: String, label: String) {
        categoryCellImage.image = UIImage(named: image)
        categoryCellLabel.text = label
    }
}

extension CategoryViewCell {
    static var identifier: String {
        String(describing: CategoryViewCell.self)
    }
}

extension CategoryViewCell {
    func selectCategory(isSelected: Bool) {
        if isSelected {
            categoryCellImage.layer.shadowColor = UIColor.accentOrange.cgColor
            categoryCellImage.layer.shadowRadius = 3
            categoryCellImage.layer.shadowOpacity = 0.7
            categoryCellImage.layer.shadowOffset = CGSize(width: 0, height: 0)
            categoryCellImage.layer.masksToBounds = false
        } else {
            categoryCellImage.layer.shadowColor = UIColor.clear.cgColor
        }
    }
}

