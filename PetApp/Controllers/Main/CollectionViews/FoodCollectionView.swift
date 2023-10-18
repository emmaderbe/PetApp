import UIKit

// MARK: - Properties
class FoodCollectionView: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var showFavouritesOnly: Bool = false {
        didSet {
            reloadData()
        }
    }
    
    var isFiltering: Bool = false {
        didSet {
            if !isFiltering {
                filteredProducts = dogProduct
            }
            reloadData()
        }
    }
    
    private var navigationController: UINavigationController?
    
    var dogProduct: [DogProduct] = []
    var filteredProducts: [DogProduct] = []
    
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
        
        loadProducts()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - numberOFItemsInSection
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if isFiltering {
            return filteredProducts.count
        }
        return dogProduct.count
    }
    
    // MARK: - cellForItemAt
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: StringConstants.reuseIdFoodViewCell, for: indexPath) as! FoodViewCell
        var product: DogProduct
        if isFiltering {
            product = filteredProducts[indexPath.row]
        } else {
            product = dogProduct[indexPath.row]
        }
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
        let product: DogProduct
        if isFiltering {
            product = filteredProducts[indexPath.row]
        } else {
            product = dogProduct[indexPath.row]
        }
        detailVC.title = product.product
        detailVC.product = product
        navigationController?.pushViewController(detailVC, animated: true)
    }
}

//MARK: - setProducts()
extension FoodCollectionView {
    func setProducts(products: [DogProduct]) {
        self.dogProduct = products
    }
}

//MARK: - loadProducts()
extension FoodCollectionView {
    func loadProducts() {
        if showFavouritesOnly {
            dogProduct = DogProductDataManager.shared.getFavouriteProducts()
        } else {
            dogProduct = DogProductDataManager.shared.getAllProducts()
        }
    }
}


//MARK: - reloadData()
extension FoodCollectionView {
    override func reloadData() {
        loadProducts()
        super.reloadData()
    }
}

extension FoodCollectionView {
    func filterProducts(by searchText: String) {
        filteredProducts = dogProduct.filter { product in
            return product.product.lowercased().contains(searchText.lowercased())
        }
        isFiltering = !filteredProducts.isEmpty
    }
}
