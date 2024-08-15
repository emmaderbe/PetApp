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
    
    private let searchController = UISearchController(searchResultsController: nil)
    
    private var currentSelectedCategory: String?
    private var isSearching: Bool = false
    
    private let customAlert = CustomAlertViewController()
    private var keyboardManager: KeyboardManager?
    
    init(productDataManager: DogProductDataManagerProtocol = DogProductDataManager(),
         favouritesManager: FavouritesManagerProtocol = FavouritesManager(),
         searchManager: SearchManagerProtocol = SearchManager()) {
        self.productDataManager = productDataManager
        self.favouritesManager = favouritesManager
        self.searchManager = searchManager
        super.init(nibName: nil, bundle: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(favouritesUpdated), name: .favouritesUpdated, object: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: .favouritesUpdated, object: nil)
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

// MARK: - load products
private extension MainVC {
    func loadProducts() {
        productDataManager.getAllProductsTypes { [weak self] productTypes in
            self?.categoryDataSource.updateTypes(productTypes)
            self?.categoryDelegate.updateTypes(productTypes)
            self?.mainView.reloadCategoryData()
        }
        productDataManager.getAllProducts { [weak self] products in
            self?.foodDataSource.updateProducts(products)
            self?.applyCurrentCategoryFilter()
        }
    }
    
    @objc func favouritesUpdated() {
        applyCurrentCategoryFilter()
    }
    
    func applyCurrentCategoryFilter() {
        guard let selectedCategory = currentSelectedCategory else {
            productDataManager.getAllProducts { [weak self] products in
                self?.foodDataSource.updateProducts(products)
                self?.mainView.reloadFoodData()
            }
            return
        }
        
        productDataManager.filterProductsByCategory(category: selectedCategory) { [weak self] filteredProducts in
            self?.foodDataSource.updateProducts(filteredProducts)
            self?.foodDelegate.updateProducts(filteredProducts)
            self?.mainView.reloadFoodData()
        }
    }
    
    func updateFavouriteStatus(for product: DogProductModelDTO) {
        favouritesManager.updateFavourite(product: product)
        applyCurrentCategoryFilter()
    }
}

// MARK: - setup view
private extension MainVC {
    func setupView() {
        let backButton = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem = backButton
        
        keyboardManager = KeyboardManager(view: mainView.foodCollectionViewForKeyboardHandling)
        
        setupText()
        setupCategoryCollection()
        setupFoodCollection()
        setupSearchBar()
        setupDelegate()
    }
    
    func setupText() {
        mainView.setupText(category: NSLocalizedString("categoryLabelMainVC", comment: ""),
                           allFood: NSLocalizedString("allFoodLabelMainVC", comment: ""))
    }
    
    func setupSearchBar() {
        navigationItem.searchController = searchController
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = NSLocalizedString("searchBarMainVC", comment: "")
        searchController.searchBar.searchTextField.clearButtonMode = .never
        searchController.searchBar.searchBarStyle = .minimal
        searchController.searchBar.delegate = self
        definesPresentationContext = true
    }
    
    func setupCategoryCollection() {
        mainView.setupCategoryCollectionView(dataSource: categoryDataSource,
                                             delegate: categoryDelegate)
        categoryDelegate.delegate = self
    }
    
    func setupFoodCollection() {
        mainView.setupFoodCollectionView(dataSource: foodDataSource,
                                         delegate: foodDelegate)
        foodDelegate.delegate = self
    }
    
    func setupDelegate() {
        mainView.setupProductUnavailableViewDelegate(delegate: self)
    }
}


// MARK: - UISearchResultsUpdating
extension MainVC: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        if let searchText = searchController.searchBar.text {
            filterContentForSearchText(searchText)
        }
    }
}

// MARK: - UISearchBarDelegate, filter products
extension MainVC: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filterContentForSearchText(searchText)
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        isSearching = true
        categoryDelegate.resetSelection(in: mainView.getCategoryCollectionView())
        updateViewForSearchState()
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        if let text = searchBar.text, text.isEmpty {
            isSearching = false
            updateViewForSearchState()
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        isSearching = false
        updateViewForSearchState()
    }
}

private extension MainVC {
    func filterContentForSearchText(_ searchText: String) {
        productDataManager.filterProductsBySearchBar(searchText: searchText) { [weak self] filteredProducts in
            self?.foodDataSource.updateProducts(filteredProducts)
            self?.foodDelegate.updateProducts(filteredProducts)
            self?.mainView.reloadFoodData()
            
            let productsFound = !filteredProducts.isEmpty
            self?.mainView.showProductUnavailableView(!productsFound, product: searchText)
        }
    }
    
    func updateViewForSearchState() {
        mainView.updateViewForSearchState(isSearching: isSearching)
    }
}

// MARK: - CategorySelectionDelegate, choose category
extension MainVC: CategorySelectedDelegate {
    func categorySelected(_ category: DogProductTypeModelDTO?) {
        if currentSelectedCategory == category?.type {
            currentSelectedCategory = nil
        } else {
            currentSelectedCategory = category?.type
        }
        filterContentForCategory(currentSelectedCategory)
        scrollToTopOfFoodCollectionView()
    }
}

private extension MainVC {
    func filterContentForCategory(_ category: String?) {
        productDataManager.filterProductsByCategory(category: category ?? "") { [weak self] filteredProducts in
            self?.foodDataSource.updateProducts(filteredProducts)
            self?.foodDelegate.updateProducts(filteredProducts)
            self?.mainView.reloadFoodData()
        }
    }
    
    func scrollToTopOfFoodCollectionView() {
        guard foodDataSource.numberOfItems(in: 0) > 0 else { return }
        mainView.scrollFoodCollectionViewToTop()
    }
}

// MARK: - FoodSelectionDelegate, go to detail view
extension MainVC: FoodSelectionDelegate {
    func foodSelected(_ product: DogProductModelDTO) {
        let detailVC = DetailVC(productInfo: product)
        detailVC.title = product.product
        navigationController?.pushViewController(detailVC, animated: true)
    }
}

// MARK: - nextButtonDidTap(), open alert for the email
extension MainVC: NextButtonDelegate {
    func nextButtonDidTap() {
        let vc = customAlert
        if let searchText = searchController.searchBar.text {
            vc.updateProduct(product: searchText)
        }
        vc.presentWithFade(from: self)
    }
}

