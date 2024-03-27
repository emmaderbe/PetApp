import UIKit

// MARK: - Properties
class FoodCollectionView: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource {
    
    private var navigationController: UINavigationController?
    
    var showFavouritesOnly: Bool = false
    private var inSearchMode: Bool = false
    
    private var basicDogProductList: [DogProductModel] = []
    var filteredProductsList: [DogProductModel] = []
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
        contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
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
        let product = dogProductList[indexPath.row]
        cell.foodCellImage.image = UIImage(named: product.photo.first ?? "")
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
        let width = collectionView.bounds.width - (insets.left + insets.right)
        return CGSize(width: width, height: VcConstraintsConstants.FoodCellConstraints.cellHeight)
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
        if !inSearchMode {
            loadBasicProductsArray()
        }
        super.reloadData()
    }
}

//MARK: - filterProductsBySearchBar()
extension FoodCollectionView {
    func filterProductsBySearchBar(by searchText: String) {
        if searchText.isEmpty {
            filteredProductsList = basicDogProductList
            inSearchMode = false
        } else {
            filteredProductsList = basicDogProductList.filter { product in
                return product.product.lowercased().contains(searchText.lowercased())
            }
            inSearchMode = true
        }
        reloadData()
    }
}

//MARK: - filterProductsByCategory()
extension FoodCollectionView {
    func filterProductsByCategory(byCategory category: String) {
        if category.isEmpty {
            filteredProductsList = basicDogProductList
        } else {
            filteredProductsList = basicDogProductList.filter { $0.type.contains(category) }
        }
        inSearchMode = !category.isEmpty
        reloadData()
    }
}

//MARK: - resetCategorySearchToAllProducts
extension FoodCollectionView {
    func resetCategorySearchToAllProducts() {
        inSearchMode = false
        reloadData()
    }
}
