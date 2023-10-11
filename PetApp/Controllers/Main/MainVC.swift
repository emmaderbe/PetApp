import UIKit

// MARK: - Properties
class MainVC: UIViewController {
    
    private let searchBar: UISearchBar = {
        let search = UISearchBar()
        search.searchBarStyle = .minimal
        search.placeholder = NSLocalizedString("searchBarMainVC", comment: "")
        search.translatesAutoresizingMaskIntoConstraints = false
        search.returnKeyType = .go
        return search
    }()
    
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
        view.addSubview(searchBar)
        view.addSubview(categoryLabel)
        view.addSubview(categoryCollectionView)
        view.addSubview(allFoodLabel)
        view.addSubview(foodCollectionView)
    }
}

// MARK: - setupConstraints()
extension MainVC {
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: VcConstraintsConstants.MainVcConstraints.generalLeading),
            searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: VcConstraintsConstants.MainVcConstraints.generalTrailing),
            
            categoryLabel.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: VcConstraintsConstants.MainVcConstraints.generalTop),
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

