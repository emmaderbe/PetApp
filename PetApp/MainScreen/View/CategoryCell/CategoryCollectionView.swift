import UIKit

protocol CategorySelectionDelegate: AnyObject {
    func didSelectCategory(_ category: DogProductTypeModel)
}

class CategoryCollectionView: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource {
    
    private let dogProductTypes: [DogProductTypeModel] = {
        return DogProductDataManager.shared.getAllProductsTypes()
    }()
    weak var categoryDelegate: CategorySelectionDelegate?
    
    // MARK: - init
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        super.init(frame: .zero, collectionViewLayout: layout)
        translatesAutoresizingMaskIntoConstraints = false
        layout.minimumLineSpacing = VcConstraintsConstants.CategoryCellConstraints.lineSpacing
        contentInset = UIEdgeInsets(top: 0, left: VcConstraintsConstants.CategoryCellConstraints.leftDestination, bottom: 0, right: VcConstraintsConstants.CategoryCellConstraints.rightDestination)
        
        backgroundColor = .accentBackground
        delegate = self
        dataSource = self
        register(CategoryViewCell.self, forCellWithReuseIdentifier: StringConstants.CellIdentifier.reuseIdCategoryViewCell)
        
        self.showsHorizontalScrollIndicator = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - numberOFItemsInSection
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dogProductTypes.count
    }
    
    // MARK: - cellForItemAt
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: StringConstants.CellIdentifier.reuseIdCategoryViewCell, for: indexPath) as! CategoryViewCell
        let type = dogProductTypes[indexPath.row]
        cell.setupCell(image: type.photo, label: type.type)
        return cell
    }
}

//MARK: - sizeForItem
extension CategoryCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return  CGSize(width: VcConstraintsConstants.CategoryCellConstraints.cellWidth, height: VcConstraintsConstants.CategoryCellConstraints.cellHeight)
    }
}

//MARK: - didSelectItemAt
extension CategoryCollectionView {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedType = dogProductTypes[indexPath.row]
        categoryDelegate?.didSelectCategory(selectedType)
    }
}

//extension CategoryCollectionView {
//    func setDataSource(_ dataSource: CategoryCollectionDataSource) {
//        self.dataSource = dataSource
//    }
//
//    func setDelegates(_ delegate: CategoryCollectionDelegate) {
//        self.delegate = delegate
//    }
//}
