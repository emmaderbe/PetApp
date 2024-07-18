//import UIKit
//
//final class CategoryCollectionDataSource: NSObject, UICollectionViewDataSource {
//    private lazy var dogProductListType: [DogProductTypeModel] = {
//        return DogProductDataManager.shared.getAllProductsTypes()
//   }()
//}
//
//extension CategoryCollectionDataSource {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return dogProductListType.count
//    }
//}
//
//extension CategoryCollectionDataSource {
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        guard  let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StringConstants.CellIdentifier.reuseIdCategoryViewCell, for: indexPath) as? CategoryViewCell
//        else { return UICollectionViewCell() }
//        let category = dogProductListType[indexPath.row]
//        cell.setupCell(image: category.photo,
//                       label: category.type)
//        return cell
//    }
//}
