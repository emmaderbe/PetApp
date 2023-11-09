import UIKit

// MARK: - Properties
class MainVC: UIViewController {
    
    private let searchController = UISearchController(searchResultsController: nil)
    
    private let products = DogProductDataManager.shared.getAllProducts()
    
    private var searchBarIsEmpty: Bool {
        guard let text = searchController.searchBar.text else {return false}
        return text.isEmpty
    }
    
    private var isFiltering: Bool {
        return searchController.isActive && !searchBarIsEmpty
    }
    
    private let categoryLabel: UILabel = {
        let label = UILabel()
        label.text = NSLocalizedString("categoryLabelMainVC", comment: "")
        label.font = .montserratBold16()
        label.numberOfLines = 0
        label.textAlignment = .left
        label.textColor = .accentText
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var categoryCollectionView = CategoryCollectionView()
    
    private let allFoodLabel: UILabel = {
        let label = UILabel()
        label.text = NSLocalizedString("allFoodLabelMainVC", comment: "")
        label.font = .montserratBold16()
        label.numberOfLines = 0
        label.textAlignment = .left
        label.textColor = .accentText
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var foodCollectionView: FoodCollectionView!
    
    // MARK: - viewWillAppear()
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        foodCollectionView.chooseTypeOfProductArray(typeOfProducts: products)
        foodCollectionView.reloadData()
    }
    
    
    // MARK: - viewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
    }
}

// MARK: - setupView()
extension MainVC {
    func setupView() {
        foodCollectionView = FoodCollectionView(navigationController: navigationController)
        let backButton = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem = backButton
        
        view.backgroundColor = .accentBackground
        view.addSubview(categoryLabel)
        view.addSubview(categoryCollectionView)
        view.addSubview(allFoodLabel)
        view.addSubview(foodCollectionView)
        setupSearchController()
        
    }
}

// MARK: - setupConstraints()
extension MainVC {
    func setupConstraints() {
        NSLayoutConstraint.activate([
            categoryLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: VcConstraintsConstants.MainVcConstraints.generalTop),
            categoryLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: VcConstraintsConstants.MainVcConstraints.generalLeading * 2),
            
            categoryCollectionView.topAnchor.constraint(equalTo: categoryLabel.bottomAnchor, constant: VcConstraintsConstants.MainVcConstraints.collectionTop),
            categoryCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            categoryCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            categoryCollectionView.heightAnchor.constraint(equalToConstant: VcConstraintsConstants.MainVcConstraints.collectionHeight),
            
            allFoodLabel.topAnchor.constraint(equalTo: categoryCollectionView.bottomAnchor, constant: VcConstraintsConstants.MainVcConstraints.generalTop * 4),
            allFoodLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: VcConstraintsConstants.MainVcConstraints.generalLeading * 2),
            
            foodCollectionView.topAnchor.constraint(equalTo: allFoodLabel.bottomAnchor, constant: VcConstraintsConstants.MainVcConstraints.collectionTop),
            foodCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            foodCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            foodCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

// MARK: - setupSearchController()
extension MainVC {
    func setupSearchController() {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = NSLocalizedString("searchBarMainVC", comment: "")
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }
}

// MARK: - updateSearchResults()
extension MainVC: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        if let searchText = searchController.searchBar.text {
            filterContentForSearchText(searchText)
        }
    }
}

// MARK: - filterContentForSearchText()
extension MainVC {
    private func filterContentForSearchText(_ searchText: String) {
        foodCollectionView.filterProducts(by: searchText)
    }
}


