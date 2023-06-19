import UIKit

// MARK: - Properties
class FavouritesVC: UIViewController {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Избранное"
        label.font = .montserratSemiBold17()
        label.numberOfLines = 1
        label.textAlignment = .center
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
extension FavouritesVC {
    func setupView() {
        view.backgroundColor = .accentBackground
        view.addSubview(titleLabel)
        view.addSubview(foodCollectionView)
    }
}

// MARK: - setupConstraints()
extension FavouritesVC {
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 64),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            foodCollectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 11),
            foodCollectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            foodCollectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            foodCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
    }
}
