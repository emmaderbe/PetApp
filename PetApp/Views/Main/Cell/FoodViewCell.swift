import UIKit

// MARK: - Properties
class FoodViewCell: UICollectionViewCell {
    
    lazy var foodCellImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 16
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var foodIndicatorImage: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 5
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var foodNameLabel: UILabel = {
        let label = UILabel()
        label.font = .montserratRegular16()
        label.textColor = .accentText
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var likeButton: LikeButton = {
        let button = LikeButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
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

//MARK: - setupCell()
extension FoodViewCell {
    func setupCell() {
        backgroundColor = .accentBackground
        addSubview(foodCellImage)
        addSubview(foodIndicatorImage)
        addSubview(foodNameLabel)
        addSubview(likeButton)
    }
}

//MARK: - setupCellConstraints()
extension FoodViewCell {
    func setupCellConstraints() {
        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height
        
        NSLayoutConstraint.activate([
            foodCellImage.topAnchor.constraint(equalTo: topAnchor, constant: screenHeight * ViewConstraintsConstants.FoodViewConstraints.imageTop),
            foodCellImage.leftAnchor.constraint(equalTo: leftAnchor, constant: screenWidth * ViewConstraintsConstants.FoodViewConstraints.generalLeading),
            foodCellImage.trailingAnchor.constraint(equalTo: foodNameLabel.leadingAnchor, constant: screenWidth *  ViewConstraintsConstants.FoodViewConstraints.generalTrailing),
            foodCellImage.widthAnchor.constraint(equalToConstant: screenWidth * ViewConstraintsConstants.FoodViewConstraints.imageWigth),
            foodCellImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: screenHeight * ViewConstraintsConstants.FoodViewConstraints.imageBottom),
            
            foodIndicatorImage.topAnchor.constraint(equalTo: foodCellImage.topAnchor, constant: screenHeight * ViewConstraintsConstants.FoodViewConstraints.indicatorTop),
            foodIndicatorImage.leadingAnchor.constraint(equalTo: foodCellImage.leadingAnchor, constant: screenWidth * ViewConstraintsConstants.FoodViewConstraints.indicatorLeading),
            foodIndicatorImage.heightAnchor.constraint(equalToConstant: screenHeight *  ViewConstraintsConstants.FoodViewConstraints.indicatorHeight),
            foodIndicatorImage.widthAnchor.constraint(equalTo: foodIndicatorImage.heightAnchor),
            
            foodNameLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            foodNameLabel.trailingAnchor.constraint(equalTo: likeButton.leadingAnchor, constant: screenWidth * ViewConstraintsConstants.FoodViewConstraints.generalTrailing),
            
            likeButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            likeButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: screenWidth * ViewConstraintsConstants.FoodViewConstraints.generalTrailing),
            likeButton.heightAnchor.constraint(equalToConstant: screenHeight * ViewConstraintsConstants.FoodViewConstraints.likeHeight),
            likeButton.widthAnchor.constraint(equalTo: likeButton.heightAnchor)
        ])
    }
}
