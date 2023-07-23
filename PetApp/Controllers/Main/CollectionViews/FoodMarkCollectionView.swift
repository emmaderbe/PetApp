import UIKit

class FoodMarkCollectionView: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource {
    
     lazy var dogProduct: [DogProduct] = {
        let storage = DogProductStorage()
        return storage.load() ?? []
    }()

    // MARK: - init
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        super.init(frame: .zero, collectionViewLayout: layout)
        translatesAutoresizingMaskIntoConstraints = false
        layout.minimumLineSpacing = 16
        contentInset = UIEdgeInsets(top: 0, left: CellConstants.leftDestination, bottom: 0, right: CellConstants.rightDestination)
        
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
        return dogProduct.count
    }
    
    // MARK: - cellForItemAt
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: StringConstants.reuseIdFoodMarkViewCell, for: indexPath) as! FoodMarkViewCell
        cell.categoryCellLabel.text = dogProduct[indexPath.row].type
        return cell
    }
}

//MARK: - sizeForItem
extension FoodMarkCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return  CGSize(width: 96, height: 31)
    }
}

