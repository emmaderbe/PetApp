import UIKit

class FoodMarkCollectionView: UICollectionView {
    // MARK: - init
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        super.init(frame: .zero, collectionViewLayout: layout)
        translatesAutoresizingMaskIntoConstraints = false
        layout.minimumLineSpacing = VcConstraintsConstants.FoodMarkCellConstraints.lineSpacing
        contentInset = UIEdgeInsets(top: 0, left: VcConstraintsConstants.FoodMarkCellConstraints.leftDestination, bottom: 0, right: VcConstraintsConstants.FoodMarkCellConstraints.rightDestination)
        
        backgroundColor = .accentBackground
        register(FoodMarkViewCell.self, forCellWithReuseIdentifier: FoodMarkViewCell.identifier)
        self.showsHorizontalScrollIndicator = false
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - set dataSource and delegate
extension FoodMarkCollectionView {
    func setFoodMark(_ dataSource: FoodMarkCollectionDataSource, _ delegate: FoodMarkCollectionDelegate) {
        self.dataSource = dataSource
        self.delegate = delegate
    }
    
}
