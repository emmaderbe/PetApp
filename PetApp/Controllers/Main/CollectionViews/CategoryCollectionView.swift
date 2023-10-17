import UIKit

class CategoryCollectionView: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource {
    
    private lazy var uniqueDogProductTypes: [DogProduct] = {
        let storage = DogProductStorage()
        let products = storage.load() ?? []

        var uniqueTypes: [DogProduct] = []
        var existingTypes: Set<String> = []

        for product in products {
            if !existingTypes.contains(product.type) {
                existingTypes.insert(product.type)
                uniqueTypes.append(product)
            }
        }

        return uniqueTypes
    }()

    
    // MARK: - init
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        super.init(frame: .zero, collectionViewLayout: layout)
        translatesAutoresizingMaskIntoConstraints = false
        layout.minimumLineSpacing = VcConstraintsConstants.CategoryCellConstraints.lineSpacing
        contentInset = UIEdgeInsets(top: 0, left: VcConstraintsConstants.CategoryCellConstraints.leftDestination, bottom: 0, right: VcConstraintsConstants.CategoryCellConstraints.rightDestination)
        
        backgroundColor = .accentBackground
        delegate = self
        dataSource = self
        register(CategoryViewCell.self, forCellWithReuseIdentifier: StringConstants.reuseIdCategoryViewCell)
        
        self.showsHorizontalScrollIndicator = false 
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - numberOFItemsInSection
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return uniqueDogProductTypes.count
    }
    
    // MARK: - cellForItemAt
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: StringConstants.reuseIdCategoryViewCell, for: indexPath) as! CategoryViewCell
        cell.categoryCellImage.image = UIImage(named: uniqueDogProductTypes[indexPath.row].photo)
            cell.categoryCellLabel.text = uniqueDogProductTypes[indexPath.row].type
        return cell
    }
}

//MARK: - sizeForItem
extension CategoryCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return  CGSize(width: VcConstraintsConstants.CategoryCellConstraints.cellWidth, height: VcConstraintsConstants.CategoryCellConstraints.cellHeight)
    }
}
