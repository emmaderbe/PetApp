import UIKit

//class MainView: UIView {
//    private let categoryLabel = LabelFactory.montserratBold16()
//    private lazy var categoryCollectionView = CategoryCollectionView()
//    private let allFoodLabel = LabelFactory.montserratBold16()
//    private lazy var foodCollectionView = FoodCollectionView()
//    
//    // MARK: - init()
//        override init(frame: CGRect) {
//            super.init(frame: frame )
//            setupView()
//            setupConstraints()
//        }
//        
//        required init?(coder: NSCoder) {
//            fatalError("init(coder:) has not been implemented")
//        }
//}
//
//private extension MainView {
//    func setupView() {
//        backgroundColor = .accentBackground
//        addSubview(categoryLabel)
//        addSubview(categoryCollectionView)
//        addSubview(allFoodLabel)
//        addSubview(foodCollectionView)
//    }
//}
//
//// MARK: - setupConstraints()
//private extension MainView {
//    func setupConstraints() {
//        NSLayoutConstraint.activate([
//            categoryLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: VcConstraintsConstants.MainVcConstraints.generalTop),
//            categoryLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: VcConstraintsConstants.MainVcConstraints.generalLeading * 2),
//            
//            categoryCollectionView.topAnchor.constraint(equalTo: categoryLabel.bottomAnchor, constant: VcConstraintsConstants.MainVcConstraints.collectionTop),
//            categoryCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
//            categoryCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
//            categoryCollectionView.heightAnchor.constraint(equalToConstant: VcConstraintsConstants.MainVcConstraints.collectionHeight),
//            
//            allFoodLabel.topAnchor.constraint(equalTo: categoryCollectionView.bottomAnchor, constant: VcConstraintsConstants.MainVcConstraints.generalTop * 4),
//            allFoodLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: VcConstraintsConstants.MainVcConstraints.generalLeading * 2),
//            
//            foodCollectionView.topAnchor.constraint(equalTo: allFoodLabel.bottomAnchor, constant: VcConstraintsConstants.MainVcConstraints.collectionTop),
//            foodCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
//            foodCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
//            foodCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
//        ])
//    }
//}
//
//extension MainView {
//    func setupData(category: String,
//                   allFood: String) {
//        categoryLabel.text = category
//        allFoodLabel.text = allFood
//    }
//    
//    func setupCategoryDataSource(with: CategoryCollectionDataSource) {
//        categoryCollectionView.setDataSource(with)
//    }
//    
//    func setupFoodDataSource(with: FoodCollectionDataSource) {
//        foodCollectionView.setDataSource(with)
//    }
//    
//    func setupCategoryDelegates(_ delegate: CategoryCollectionDelegate) {
//        categoryCollectionView.delegate = delegate
//    }
//    
//    func setupFoodDelegates(_ delegate: FoodCollectionDelegate) {
//        foodCollectionView.delegate = delegate
//    }
//}
