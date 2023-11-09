import UIKit

// MARK: - Properties
class FoodCollectionView: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource {
    
    private var navigationController: UINavigationController?
    
    var showFavouritesOnly: Bool = false
    private var inSearchMode: Bool = false
    
    private var basicDogProductList: [DogProductModel] = []
    private var filteredProductsList: [DogProductModel] = []
    private var dogProductList: [DogProductModel] {
        return self.inSearchMode ? filteredProductsList : basicDogProductList
    }
    
    // MARK: - init
    init(navigationController: UINavigationController?) {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        super.init(frame: .zero, collectionViewLayout: layout)
        translatesAutoresizingMaskIntoConstraints = false
        layout.minimumLineSpacing = VcConstraintsConstants.FoodCellConstraints.lineSpacing
        contentInset = UIEdgeInsets(top: 0, left: VcConstraintsConstants.FoodCellConstraints.leftDestination, bottom: 0, right: VcConstraintsConstants.FoodCellConstraints.rightDestination)
        
        backgroundColor = .accentBackground
        delegate = self
        dataSource = self
        
        register(FoodViewCell.self, forCellWithReuseIdentifier: StringConstants.reuseIdFoodViewCell)
        
        self.navigationController = navigationController
        
        loadBasicProductsArray()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - numberOFItemsInSection
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.dogProductList.count
    }
    
    // MARK: - cellForItemAt
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: StringConstants.reuseIdFoodViewCell, for: indexPath) as! FoodViewCell
        let product = self.dogProductList[indexPath.row]
        cell.foodCellImage.image = UIImage(named: product.photo)
        cell.foodIndicatorImage.image = UIImage(named: product.indicator)
        cell.foodNameLabel.text = product.product
        cell.likeButton.onTap = { [weak self] isLiked in
            if isLiked {
                FavouritesManager.shared.addFavourite(product: product)
            } else {
                FavouritesManager.shared.removeFavourite(product: product)
            }
            self?.reloadData()
        }
        cell.likeButton.isLiked = FavouritesManager.shared.isFavourite(product: product)
        return cell
    }
    
}

//MARK: - sizeForItem
extension FoodCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let insets = collectionView.contentInset
        _ = collectionView.frame.width - insets.left - insets.right
        return  CGSize(width: VcConstraintsConstants.FoodCellConstraints.cellWidth, height: VcConstraintsConstants.FoodCellConstraints.cellHeight)
    }
}

//MARK: - didSelectItemAt
extension FoodCollectionView {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailVC = DetailVC()
        let product = self.dogProductList[indexPath.row]
        detailVC.title = product.product
        detailVC.productInfo = product
        navigationController?.pushViewController(detailVC, animated: true)
    }
}

//MARK: - setProducts()
extension FoodCollectionView {
    func chooseTypeOfProductArray(typeOfProducts: [DogProductModel]) {
        self.basicDogProductList = typeOfProducts
    }
}

//MARK: - loadProducts()
extension FoodCollectionView {
    func loadBasicProductsArray() {
        if showFavouritesOnly {
            basicDogProductList = DogProductDataManager.shared.getFavouriteProducts()
        } else {
            basicDogProductList = DogProductDataManager.shared.getAllProducts()
        }
    }
}

//MARK: - reloadData()
extension FoodCollectionView {
    override func reloadData() {
        loadBasicProductsArray()
        super.reloadData()
    }
}

//MARK: - filterProducts()
extension FoodCollectionView {
    func filterProducts(by searchText: String) {
        filteredProductsList = basicDogProductList.filter { product in
            return product.product.lowercased().contains(searchText.lowercased())
        }
        inSearchMode = !searchText.isEmpty
    }
}
