import UIKit

// MARK: - Properties
class FavouritesVC: UIViewController {
    private let productDataManager: DogProductDataManagerProtocol
    private let favouritesManager: FavouritesManagerProtocol
    
    private let favouriteView = FavouriteView()
    private var foodDataSource = FoodCollectionDataSource()
    private var foodDelegate = FoodCollectionDelegate()
    
    init(productDataManager: DogProductDataManagerProtocol = DogProductDataManager(),
         favouritesManager: FavouritesManagerProtocol = FavouritesManager()) {
        self.productDataManager = productDataManager
        self.favouritesManager = favouritesManager
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = favouriteView
    }
    
    // MARK: - viewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        loadProducts()
        
        NotificationCenter.default.addObserver(self, selector: #selector(favouritesUpdated), name: .favouritesUpdated, object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: .favouritesUpdated, object: nil)
    }
    
    @objc private func favouritesUpdated() {
        loadProducts()
    }
}

// MARK: - setupView()
private extension FavouritesVC {
    func setupView() {
        let backButton = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem = backButton
        
        view.backgroundColor = .accentBackground
        
        setupFoodCollection()
    }
    
    func loadProducts() {
        favouritesManager.getFavouriteProducts { [weak self] products in
            guard let self = self else { return }
            self.foodDataSource.updateProducts(products)
            self.foodDelegate.updateProducts(products)
            self.favouriteView.reloadFoodData()
            checkProductList()
        }
    }
}

private extension FavouritesVC {
    func setupFoodCollection() {
        favouriteView.setupFoodCollectionView(dataSource: foodDataSource,
                                              delegate: foodDelegate)
        foodDelegate.delegate = self
    }
    
    func checkProductList() {
        if foodDataSource.isEmpty() {
            favouriteView.setupText(with: NSLocalizedString("emptyFavList", comment: ""))
            favouriteView.showListLabel(isEmpty: true)
        }
        else {
            favouriteView.showListLabel(isEmpty: false)
        }
    }
}

// MARK: - FoodSelectionDelegate
extension FavouritesVC: FoodSelectionDelegate {
    func foodSelected(_ product: DogProductModelDTO) {
        let detailVC = DetailVC(productInfo: product)
        detailVC.title = product.product
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
