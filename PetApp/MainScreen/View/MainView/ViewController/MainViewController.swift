import UIKit
import MessageUI

// MARK: - Properties
class MainVC: UIViewController {
    private let productDataManager: DogProductDataManagerProtocol
    private let favouritesManager: FavouritesManagerProtocol
    private let searchManager: SearchManagerProtocol
    
    private let mainView = MainView()
    private let categoryDataSource = CategoryCollectionDataSource()
    private let categoryDelegate = CategoryCollectionDelegate()
    private var foodDataSource = FoodCollectionDataSource()
    private var foodDelegate = FoodCollectionDelegate()
    
    private var currentSelectedCategory: String?
    
    private let productContentUnavailableView = ProductContentUnavailableView(product: "")
    private let customAlert = CustomAlertViewController()
    
    init(productDataManager: DogProductDataManagerProtocol = DogProductDataManager(),
         favouritesManager: FavouritesManagerProtocol = FavouritesManager(),
         searchManager: SearchManagerProtocol = SearchManager()) {
        self.productDataManager = productDataManager
        self.favouritesManager = favouritesManager
        self.searchManager = searchManager
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        loadProducts()
    }
}

private extension MainVC {
    func loadProducts() {
        productDataManager.getAllProducts { [weak self] products in
            self?.foodDataSource.updateProducts(products)
            self?.mainView.reloadData()
        }
        productDataManager.getAllProductsTypes { [weak self] productTypes in
            self?.categoryDataSource.updateTypes(productTypes)
            self?.mainView.reloadData()
        }
    }
}

// MARK: - setupView()
private extension MainVC {
    func setupView() {
        let backButton = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem = backButton
        
        setupText()
        setupCategoryCollection()
        setupFoodCollection()
        setupSearchBar()
        
        setupContentUnavailableView()
    }
    
    func setupText() {
        mainView.setupText(category: NSLocalizedString("categoryLabelMainVC", comment: ""),
                           allFood: NSLocalizedString("allFoodLabelMainVC", comment: ""),
                           search: NSLocalizedString("searchBarMainVC", comment: ""))
    }
    
    func setupCategoryCollection() {
        mainView.setupCategoryCollectionView(dataSource: categoryDataSource, delegate: categoryDelegate)
    }
    
    func setupFoodCollection() {
        mainView.setupFoodCollectionView(dataSource: foodDataSource, delegate: foodDelegate)
    }
    
    func setupSearchBar() {
        mainView.setupSearchBarDelegate(self)
    }
    
    func setupDelegate() {
        productContentUnavailableView.setDelegate(self)
    }
}

private extension MainVC {
    func setupContentUnavailableView() {
        productContentUnavailableView.translatesAutoresizingMaskIntoConstraints = false
        productContentUnavailableView.isHidden = true
        view.addSubview(productContentUnavailableView)
        NSLayoutConstraint.activate([
            productContentUnavailableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            productContentUnavailableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            productContentUnavailableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            productContentUnavailableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}

// MARK: - nextButtonDidTap()
extension MainVC: NextButtonDelegate {
    func nextButtonDidTap() {
        let vc = customAlert
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true, completion: nil)
    }
}

// MARK: - UISearchBarDelegate
extension MainVC: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filterContentForSearchText(searchText)
    }
    
    private func filterContentForSearchText(_ searchText: String) {
        productDataManager.filterProductsBySearchBar(searchText: searchText) { [weak self] filteredProducts in
            self?.foodDataSource.updateProducts(filteredProducts)
            self?.mainView.reloadData()
            
            let productsFound = !filteredProducts.isEmpty
            self?.productContentUnavailableView.isHidden = productsFound
            if !productsFound {
                self?.productContentUnavailableView.updateProduct(product: searchText)
            }
        }
    }
}

// MARK: - FoodSelectionDelegate
extension MainVC: FoodSelectionDelegate {
    func foodSelected(_ product: DogProductModelDTO) {
        let detailVC = DetailVC(productInfo: product)
        detailVC.title = product.product
        navigationController?.pushViewController(detailVC, animated: true)
    }
}

//// MARK: - CategorySelectionDelegate
//extension MainVC: CategorySelectionDelegate {
//    func didSelectCategory(_ category: DogProductTypeModel) {
//        if currentSelectedCategory == category.type {
//            currentSelectedCategory = nil
//        } else {
//            currentSelectedCategory = category.type
//        }
//        filterContentForSearchText(mainView.searchBar.text ?? "")
//    }
//}
