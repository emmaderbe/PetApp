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
        register(FoodMarkViewCell.self, forCellWithReuseIdentifier: StringConstants.CellIdentifier.reuseIdFoodMarkViewCell)
        self.showsHorizontalScrollIndicator = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - sizeForItem
extension FoodMarkCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return  CGSize(width: VcConstraintsConstants.FoodMarkCellConstraints.cellWidth, height: VcConstraintsConstants.FoodMarkCellConstraints.cellHeight)
    }
}

//MARK: - set dataSource and delegate
extension FoodMarkCollectionView {
    func setDataSource(_ dataSource: FoodMarkCollectionDataSource) {
        self.dataSource = dataSource
    }
}
