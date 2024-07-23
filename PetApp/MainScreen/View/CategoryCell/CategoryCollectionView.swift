import UIKit

final class CategoryCollectionView: UICollectionView {
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        super.init(frame: .zero, collectionViewLayout: layout)
        translatesAutoresizingMaskIntoConstraints = false
        layout.minimumLineSpacing = VcConstraintsConstants.CategoryCellConstraints.lineSpacing
        contentInset = UIEdgeInsets(top: 0, left: VcConstraintsConstants.CategoryCellConstraints.leftDestination, bottom: 0, right: VcConstraintsConstants.CategoryCellConstraints.rightDestination)
        
        backgroundColor = .accentBackground
        register(CategoryViewCell.self, forCellWithReuseIdentifier: CategoryViewCell.identifier)
        
        self.showsHorizontalScrollIndicator = false
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
