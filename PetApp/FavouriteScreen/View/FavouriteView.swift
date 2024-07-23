import UIKit

final class FavouriteView: UIView {
    private let foodCollectionView = FoodCollectionView()
    
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

private extension FavouriteView {
    func setupView() {
        backgroundColor = .accentBackground
        addSubview(foodCollectionView)
    }
}

// MARK: - setupConstraints()
private extension FavouriteView {
    func setupConstraints() {
        NSLayoutConstraint.activate([
            foodCollectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            foodCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            foodCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            foodCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}

extension FavouriteView {
    func reloadFoodData() {
        foodCollectionView.reloadData()
    }
    
    func setupFoodCollectionView(dataSource: FoodCollectionDataSource,
                                 delegate: FoodCollectionDelegate) {
        foodCollectionView.dataSource = dataSource
        foodCollectionView.delegate = delegate
    }
}
