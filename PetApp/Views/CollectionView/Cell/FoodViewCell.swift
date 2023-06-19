import UIKit

// MARK: - Properties and init()
class FoodViewCell: UICollectionViewCell {
    
    let foodCellImage: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .blue
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 16
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let foodIndicatorImage: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .red
        image.layer.cornerRadius = 5
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let foodNameLabel: UILabel = {
        let label = UILabel()
        label.font = .montserratRegular16()
        label.textColor = .accentText
        label.text = "Огурец"
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //    var foodLikeButton = LikeButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
        setupCellConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

//MARK: - setupCellConstraints
extension FoodViewCell {
    func setupCell() {
        backgroundColor = .accentBackground
        addSubview(foodCellImage)
//        foodCellImage.addSubview(foodIndicatorImage)
        addSubview(foodIndicatorImage)
        addSubview(foodNameLabel)
        //        addSubview(recieptLikeButton)
    }
}

//MARK: - setupCellConstraints
extension FoodViewCell {
    func setupCellConstraints() {
        NSLayoutConstraint.activate([
            foodCellImage.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            foodCellImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            foodCellImage.trailingAnchor.constraint(equalTo: foodNameLabel.leadingAnchor, constant: -16),
    //        foodCellImage.heightAnchor.constraint(equalToConstant: 32).isActive = true
            foodCellImage.widthAnchor.constraint(equalToConstant: 32),
            foodCellImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12),
                
            
            foodIndicatorImage.topAnchor.constraint(equalTo: foodCellImage.topAnchor, constant: 22),
            foodIndicatorImage.leadingAnchor.constraint(equalTo: foodCellImage.leadingAnchor, constant: 22),
            foodIndicatorImage.heightAnchor.constraint(equalToConstant: 10),
            foodIndicatorImage.widthAnchor.constraint(equalToConstant: 10),
            
            foodNameLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            foodNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            //        foodNameLabel.trailingAnchor.constraint(equalTo: recieptLikeButton.leadingAnchor, constant: -16).isActive = true
        ])
        
//        recieptLikeButton.translatesAutoresizingMaskIntoConstraints = false
//        recieptLikeButton.heightAnchor.constraint(equalTo: foodCellImage.heightAnchor, multiplier: 0.75).isActive = true
//        recieptLikeButton.widthAnchor.constraint((equalTo: foodCellImage.widthAnchor, multiplier: 0.75).isActive = true
//        recieptLikeButton.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
//        recieptLikeButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        }
}
