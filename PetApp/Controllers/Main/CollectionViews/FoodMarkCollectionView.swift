import UIKit

class FoodMarkCollectionView: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource {
    
     lazy var dogProductListType: [DogProductTypeModel] = {
         return DogProductDataManager.shared.getAllProductsTypes()
    }()

    // MARK: - init
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        super.init(frame: .zero, collectionViewLayout: layout)
        translatesAutoresizingMaskIntoConstraints = false
        layout.minimumLineSpacing = VcConstraintsConstants.FoodMarkCellConstraints.lineSpacing
        contentInset = UIEdgeInsets(top: 0, left: VcConstraintsConstants.FoodMarkCellConstraints.leftDestination, bottom: 0, right: VcConstraintsConstants.FoodMarkCellConstraints.rightDestination)
        
        backgroundColor = .accentBackground
        delegate = self
        dataSource = self
        register(FoodMarkViewCell.self, forCellWithReuseIdentifier: StringConstants.reuseIdFoodMarkViewCell)
        
        self.showsHorizontalScrollIndicator = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - numberOFItemsInSection
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dogProductListType.count
    }
    
    // MARK: - cellForItemAt
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: StringConstants.reuseIdFoodMarkViewCell, for: indexPath) as! FoodMarkViewCell
        let category = dogProductListType[indexPath.row]
        cell.categoryCellLabel.text = category.type
        cell.categoryCellBackground.image = UIImage(named: category.backgroundType)
        return cell
    }
}

//MARK: - sizeForItem
extension FoodMarkCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return  CGSize(width: VcConstraintsConstants.FoodMarkCellConstraints.cellWidth, height: VcConstraintsConstants.FoodMarkCellConstraints.cellHeight)
    }
}

