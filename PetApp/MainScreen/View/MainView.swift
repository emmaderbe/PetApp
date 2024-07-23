import UIKit

final class MainView: UIView {
    private let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.searchBarStyle = .minimal
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        return searchBar
    }()
    private let categoryLabel = LabelFactory.montserratBold16()
    private let categoryCollectionView = CategoryCollectionView()
    private let allFoodLabel = LabelFactory.montserratBold16()
    private let foodCollectionView = FoodCollectionView()
    
    // MARK: - init()
    override init(frame: CGRect) {
        super.init(frame: frame )
        setupView()
        setupConstraints()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension MainView {
    func setupView() {
        backgroundColor = .accentBackground
        addSubview(searchBar)
        addSubview(categoryLabel)
        addSubview(categoryCollectionView)
        addSubview(allFoodLabel)
        addSubview(foodCollectionView)
    }
}

// MARK: - setupConstraints()
private extension MainView {
    func setupConstraints() {
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            searchBar.leadingAnchor.constraint(equalTo: leadingAnchor, constant: VcConstraintsConstants.MainVcConstraints.generalLeading),
            searchBar.trailingAnchor.constraint(equalTo: trailingAnchor, constant: VcConstraintsConstants.MainVcConstraints.generalTrailing),
            
            categoryLabel.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: VcConstraintsConstants.MainVcConstraints.generalTop),
            categoryLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: VcConstraintsConstants.MainVcConstraints.generalLeading * 2),
            
            categoryCollectionView.topAnchor.constraint(equalTo: categoryLabel.bottomAnchor, constant: VcConstraintsConstants.MainVcConstraints.collectionTop),
            categoryCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            categoryCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            categoryCollectionView.heightAnchor.constraint(equalToConstant: VcConstraintsConstants.MainVcConstraints.collectionHeight),
            
            allFoodLabel.topAnchor.constraint(equalTo: categoryCollectionView.bottomAnchor, constant: VcConstraintsConstants.MainVcConstraints.generalTop * 4),
            allFoodLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: VcConstraintsConstants.MainVcConstraints.generalLeading * 2),
            
            foodCollectionView.topAnchor.constraint(equalTo: allFoodLabel.bottomAnchor, constant: VcConstraintsConstants.MainVcConstraints.collectionTop),
            foodCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            foodCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            foodCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}

extension MainView {
    func setupText(category: String,
                   allFood: String, search: String) {
        categoryLabel.text = category
        allFoodLabel.text = allFood
        searchBar.placeholder = search
    }
    
    func setupSearchBarDelegate(_ delegate: UISearchBarDelegate) {
        searchBar.delegate = delegate
    }
}

extension MainView {
    func reloadCategoryData() {
        categoryCollectionView.reloadData()
    }
    
    func setupCategoryCollectionView(dataSource: CategoryCollectionDataSource,
                                     delegate: CategoryCollectionDelegate) {
        categoryCollectionView.dataSource = dataSource
        categoryCollectionView.delegate = delegate
    }
}

extension MainView {
    func reloadFoodData() {
        foodCollectionView.reloadData()
    }
    
    func setupFoodCollectionView(dataSource: FoodCollectionDataSource,
                                 delegate: FoodCollectionDelegate) {
        foodCollectionView.dataSource = dataSource
        foodCollectionView.delegate = delegate
    }
}
