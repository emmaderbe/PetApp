import UIKit

// MARK: - Properties
final class FoodCollectionView: UICollectionView {
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        super.init(frame: .zero, collectionViewLayout: layout)
        translatesAutoresizingMaskIntoConstraints = false
        layout.minimumLineSpacing = VcConstraintsConstants.FoodCellConstraints.lineSpacing
        contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        backgroundColor = .accentBackground
        
        register(FoodViewCell.self, forCellWithReuseIdentifier: FoodViewCell.identifier)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
