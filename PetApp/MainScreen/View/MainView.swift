import UIKit

final class MainView: UIView {
    private let categoryLabel = LabelFactory.montserratBold16()
    private let categoryCollectionView = CategoryCollectionView()
    private let allFoodLabel = LabelFactory.montserratBold16()
    private let foodCollectionView = FoodCollectionView()
    
    private let productContentUnavailableView = ProductContentUnavailableView(product: "")
    
    private var originalConstraints: [NSLayoutConstraint] = []
    private var searchActiveConstraints: [NSLayoutConstraint] = []
    
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
        addSubview(categoryLabel)
        addSubview(categoryCollectionView)
        addSubview(allFoodLabel)
        addSubview(foodCollectionView)
        
        addSubview(productContentUnavailableView)
        productContentUnavailableView.translatesAutoresizingMaskIntoConstraints = false
        productContentUnavailableView.isHidden = true
    }
}

// MARK: - setupConstraints()
private extension MainView {
    func setupConstraints() {
        originalConstraints = [
            categoryLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
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
        ]
        NSLayoutConstraint.activate(originalConstraints)
    }
    
    func setupSearchActiveConstraints() {
        searchActiveConstraints = [
            foodCollectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            foodCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            foodCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            foodCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            productContentUnavailableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            productContentUnavailableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            productContentUnavailableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            productContentUnavailableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ]
    }
    
    func updateViewWithAnimation() {
        UIView.animate(withDuration: 0.3) {
            self.layoutIfNeeded()
        }
    }
}

extension MainView {
    func setupText(category: String,
                   allFood: String) {
        categoryLabel.text = category
        allFoodLabel.text = allFood
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

extension MainView {
    func updateViewForSearchState(isSearching: Bool) {
        categoryLabel.isHidden = isSearching
        categoryCollectionView.isHidden = isSearching
        allFoodLabel.isHidden = isSearching
        
        NSLayoutConstraint.deactivate(originalConstraints)
        NSLayoutConstraint.deactivate(searchActiveConstraints)
        
        if isSearching {
            setupSearchActiveConstraints()
            NSLayoutConstraint.activate(searchActiveConstraints)
        } else {
            NSLayoutConstraint.activate(originalConstraints)
        }
        
        updateViewWithAnimation()
    }
}

extension MainView {
    func showProductUnavailableView(_ show: Bool, product: String?) {
        productContentUnavailableView.isHidden = !show
        productContentUnavailableView.updateProduct(product: product ?? "")
        
        updateViewWithAnimation()
    }
    
    func setupProductUnavailableViewDelegate(delegate: NextButtonDelegate) {
        productContentUnavailableView.setDelegate(delegate)
    }
}
