import UIKit

// MARK: - Properties
class MainVC: UIViewController {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Cписок продуктов"
        label.font = .montserratSemiBold17()
        label.numberOfLines = 1
        label.textAlignment = .center
        label.textColor = .accentText
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let searchBar: UISearchBar = {
        let search = UISearchBar()
        search.searchBarStyle = .minimal
        search.placeholder = "Поиск"
        search.translatesAutoresizingMaskIntoConstraints = false
        search.returnKeyType = .go
        return search
    }()
    
    private let categoryLabel: UILabel = {
        let label = UILabel()
        label.text = "Категории"
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
        label.text = "Все продукты"
        label.font = .montserratBold16()
        label.numberOfLines = 0
        label.textAlignment = .left
        label.textColor = .accentText
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var foodCollectionView = FoodCollectionView()
    
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
        view.backgroundColor = .accentBackground
        view.addSubview(titleLabel)
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
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 64),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            searchBar.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 15),
            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            
            categoryLabel.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 33),
            categoryLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
            categoryCollectionView.topAnchor.constraint(equalTo: categoryLabel.bottomAnchor, constant: 13),
            categoryCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            categoryCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            categoryCollectionView.heightAnchor.constraint(equalToConstant: 95),
            
            allFoodLabel.topAnchor.constraint(equalTo: categoryCollectionView.bottomAnchor, constant: 32),
            allFoodLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
            foodCollectionView.topAnchor.constraint(equalTo: allFoodLabel.bottomAnchor, constant: 13),
            foodCollectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            foodCollectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            foodCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
        
    }
}

