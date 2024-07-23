import UIKit

// MARK: - Properties
final class FoodViewCell: UICollectionViewCell {
    private let foodCellImage = ImageFactory.imageViewAspectFill(cornerRadius: 16)
    private let foodIndicatorImage = ImageFactory.imageViewAspectFit(cornerRadius: 5)
    private let foodNameLabel = LabelFactory.montserratRegular16()
    lazy var likeButton = LikeButton()
    
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

//MARK: - setupCell()
private extension FoodViewCell {
    func setupCell() {
        backgroundColor = .accentBackground
        addSubview(foodCellImage)
        addSubview(foodIndicatorImage)
        addSubview(foodNameLabel)
        addSubview(likeButton)
    }
}

//MARK: - setupCellConstraints()
private extension FoodViewCell {
    func setupCellConstraints() {
        NSLayoutConstraint.activate([
            foodCellImage.topAnchor.constraint(equalTo: topAnchor, constant: ViewConstraintsConstants.FoodViewConstraints.imageTop),
            foodCellImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: ViewConstraintsConstants.FoodViewConstraints.generalLeading),
            foodCellImage.trailingAnchor.constraint(equalTo: foodNameLabel.leadingAnchor, constant: ViewConstraintsConstants.FoodViewConstraints.generalTrailing),
            foodCellImage.widthAnchor.constraint(equalToConstant: ViewConstraintsConstants.FoodViewConstraints.imageWigth),
            foodCellImage.heightAnchor.constraint(equalTo: foodCellImage.widthAnchor),
            
            foodIndicatorImage.topAnchor.constraint(equalTo: foodCellImage.topAnchor, constant: ViewConstraintsConstants.FoodViewConstraints.indicatorSpacing),
            foodIndicatorImage.leadingAnchor.constraint(equalTo: foodCellImage.leadingAnchor, constant: ViewConstraintsConstants.FoodViewConstraints.indicatorSpacing),
            foodIndicatorImage.heightAnchor.constraint(equalToConstant: ViewConstraintsConstants.FoodViewConstraints.indicatorHeight),
            foodIndicatorImage.widthAnchor.constraint(equalTo: foodIndicatorImage.heightAnchor),
            
            foodNameLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            foodNameLabel.trailingAnchor.constraint(equalTo: likeButton.leadingAnchor, constant: ViewConstraintsConstants.FoodViewConstraints.generalTrailing),
            
            likeButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            likeButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: ViewConstraintsConstants.FoodViewConstraints.generalTrailing),
            likeButton.heightAnchor.constraint(equalToConstant: ViewConstraintsConstants.FoodViewConstraints.likeHeight),
        ])
    }
}

extension FoodViewCell {
    func setupData(foodImage: String, indicatorImage: String, name: String) {
        foodCellImage.image = UIImage(named: foodImage)
        foodIndicatorImage.image = UIImage(named: indicatorImage)
        foodNameLabel.text = name
    }
}

extension FoodViewCell {
    static var identifier: String {
        String(describing: FoodViewCell.self)
    }
}
