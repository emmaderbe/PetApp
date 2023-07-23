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
    }
}

//MARK: - setupCellConstraints()
extension FoodViewCell {
    func setupCellConstraints() {
        NSLayoutConstraint.activate([
            foodCellImage.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            foodCellImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            foodCellImage.trailingAnchor.constraint(equalTo: foodNameLabel.leadingAnchor, constant: -16),
            foodCellImage.widthAnchor.constraint(equalToConstant: 32),
            foodCellImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12),
                
            
            foodIndicatorImage.topAnchor.constraint(equalTo: foodCellImage.topAnchor, constant: 22),
            foodIndicatorImage.leadingAnchor.constraint(equalTo: foodCellImage.leadingAnchor, constant: 22),
            foodIndicatorImage.heightAnchor.constraint(equalToConstant: 10),
            foodIndicatorImage.widthAnchor.constraint(equalToConstant: 10),
            
            foodNameLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            foodNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
        ])
        }
}
