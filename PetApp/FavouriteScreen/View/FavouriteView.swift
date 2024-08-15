import UIKit

final class FavouriteView: UIView {
    private let foodCollectionView = FoodCollectionView()
    private let emptyListLabel = LabelFactory.montserratSemiBold16()
    
    private var emptyListConstraints: [NSLayoutConstraint] = []
    private var originalListConstraints: [NSLayoutConstraint] = []
    
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
        
        addSubview(emptyListLabel)
        emptyListLabel.isHidden = true
    }
}

// MARK: - setupConstraints()
private extension FavouriteView {
    func setupConstraints() {
        originalListConstraints = [
            foodCollectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            foodCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            foodCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            foodCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ]
        NSLayoutConstraint.activate(originalListConstraints)
    }
    
    func setupEmptyListConstrains() {
        emptyListConstraints = [
            emptyListLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            emptyListLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ]
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

extension FavouriteView {
    func setupText(with: String) {
        emptyListLabel.text = with
    }
    
    func showListLabel(isEmpty: Bool) {
        emptyListLabel.isHidden = !isEmpty
        
        NSLayoutConstraint.deactivate(originalListConstraints)
        NSLayoutConstraint.deactivate(emptyListConstraints)
        
        if isEmpty {
            setupEmptyListConstrains()
            NSLayoutConstraint.activate(emptyListConstraints)
        } else {
            NSLayoutConstraint.activate(originalListConstraints)
        }
    }
}
