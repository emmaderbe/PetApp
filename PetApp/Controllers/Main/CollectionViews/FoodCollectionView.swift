import UIKit

// MARK: - Properties
class FoodCollectionView: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource {
    
    private lazy var dogProduct: [DogProduct] = {
        let storage = DogProductStorage()
        return storage.load() ?? []
    }()
    
    private var navigationController: UINavigationController?
    
// MARK: - init
    init(navigationController: UINavigationController?) {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        super.init(frame: .zero, collectionViewLayout: layout)
        translatesAutoresizingMaskIntoConstraints = false
        layout.minimumLineSpacing = 0
        contentInset = UIEdgeInsets(top: 0, left: CellConstants.leftDestination, bottom: 0, right: CellConstants.rightDestination)
        
        backgroundColor = .accentBackground
        delegate = self
        dataSource = self
        
        register(FoodViewCell.self, forCellWithReuseIdentifier: StringConstants.reuseIdFoodViewCell)
        
        self.navigationController = navigationController
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
        let cell = dequeueReusableCell(withReuseIdentifier: StringConstants.reuseIdFoodViewCell, for: indexPath) as! FoodViewCell
        cell.foodCellImage.image = UIImage(named: dogProduct[indexPath.row].photo)
        cell.foodIndicatorImage.image = UIImage(named: dogProduct[indexPath.row].indicator)
        cell.foodNameLabel.text = dogProduct[indexPath.row].product
        return cell
    }
    
}

//MARK: - sizeForItem
extension FoodCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return  CGSize(width: 390, height: 56)
    }
}

//MARK: - didSelectItemAt
extension FoodCollectionView {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailVC = DetailVC()
        detailVC.title = dogProduct[indexPath.row].product
        detailVC.product = dogProduct[indexPath.row]
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
