//import UIKit
//
//final class FoodCollectionDataSource: NSObject, UICollectionViewDataSource {
//    private lazy var dogProductList = DogProductDataManager.shared.getAllProducts()
//}
//extension FoodCollectionDataSource {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return dogProductList.count
//    }
//}
//
//extension FoodCollectionDataSource {
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StringConstants.CellIdentifier.reuseIdFoodViewCell, for: indexPath) as? FoodViewCell
//        else {return UICollectionViewCell()}
//        let product = dogProductList[indexPath.row]
//        cell.setupData(foodImage: product.photo[0],
//                       indicatorImage: product.indicator,
//                       name: product.product)
//        cell.likeButton.onTap = { [weak self] isLiked in
//            if isLiked {
//                FavouritesManager.shared.addFavourite(product: product)
//            } else {
//                FavouritesManager.shared.removeFavourite(product: product)
//            }
//        }
//        cell.likeButton.isLiked = FavouritesManager.shared.isFavourite(product: product)
//        return cell
//        
//    }
//}
