//import UIKit
//
//// MARK: - Properties
//class FavouritesVC: UIViewController {
//    
//    private var foodCollectionView: FoodCollectionView!
//    private let favouriteProducts = DogProductDataManager.shared.getFavouriteProducts()
//    
//    // MARK: - viewWillAppear()
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        foodCollectionView.chooseTypeOfProductArray(typeOfProducts: favouriteProducts)
//        foodCollectionView.reloadData()
//    }
//    
//    // MARK: - viewDidLoad()
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        setupView()
//        setupConstraints()
//    }
//}
//
//// MARK: - setupView()
//extension FavouritesVC {
//    func setupView() {
//        foodCollectionView = FoodCollectionView(navigationController: navigationController!)
//        foodCollectionView.showFavouritesOnly = true
//        let backButton = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
//        navigationItem.backBarButtonItem = backButton
//        
//        view.backgroundColor = .accentBackground
//        view.addSubview(foodCollectionView)
//    }
//}
//
//// MARK: - setupConstraints()
//extension FavouritesVC {
//    func setupConstraints() {
//        NSLayoutConstraint.activate([
//            foodCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
//            foodCollectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
//            foodCollectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
//            foodCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
//        ])
//    }
//}
