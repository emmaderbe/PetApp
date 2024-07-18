import UIKit

final class FoodMarkCollectionDataSource: NSObject, UICollectionViewDataSource {
    private lazy var dogProductListType: [DogProductTypeModel] = {
        return DogProductDataManager.shared.getAllProductsTypes()
   }()
}

extension FoodMarkCollectionDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dogProductListType.count
    }
}

extension FoodMarkCollectionDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard  let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StringConstants.CellIdentifier.reuseIdFoodMarkViewCell, for: indexPath) as? FoodMarkViewCell
        else { return UICollectionViewCell() }
        let category = dogProductListType[indexPath.row]
        cell.setupData(image: category.backgroundType,
                       label: category.type)
        return cell
    }
}
