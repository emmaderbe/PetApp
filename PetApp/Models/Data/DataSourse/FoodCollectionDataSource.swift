import UIKit

final class FoodCollectionDataSource: NSObject, UICollectionViewDataSource {
    
    private let favouritesManager: FavouritesManagerProtocol
    private var dogProductList: [DogProductModelDTO] = []
    
    init(favouritesManager: FavouritesManagerProtocol = FavouritesManager()) {
        self.favouritesManager = favouritesManager
        super.init()
    }
}

extension FoodCollectionDataSource {
    func updateProducts(_ products: [DogProductModelDTO]) {
        self.dogProductList = products
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dogProductList.count
    }
}

extension FoodCollectionDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FoodViewCell.identifier, for: indexPath) as? FoodViewCell
        else {return UICollectionViewCell()}
        
        let product = dogProductList[indexPath.row]
        cell.setupData(foodImage: product.photo[0],
                       indicatorImage: product.indicator,
                       name: product.product)
        cell.likeButton.onTap = { [weak self] isLiked in
            if isLiked {
                self?.favouritesManager.addFavourite(product: product)
            } else {
                self?.favouritesManager.removeFavourite(product: product)
            }
        }
        cell.likeButton.isLiked = favouritesManager.isFavourite(product: product)
        return cell
        
    }
}

//extension FoodCollectionDataSource: UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let insets = collectionView.contentInset
//        let width = collectionView.bounds.width - (insets.left + insets.right)
//        return CGSize(width: width, height: VcConstraintsConstants.FoodCellConstraints.cellHeight)
//    }
//}


//    // MARK: - cellForItemAt
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = dequeueReusableCell(withReuseIdentifier: StringConstants.CellIdentifier.reuseIdFoodViewCell, for: indexPath) as! FoodViewCell
//        let product = dogProductList[indexPath.row]
//        cell.setupData(foodImage: product.photo.first ?? "", indicatorImage: product.indicator, name: product.product)
//        cell.likeButton.onTap = { [weak self] isLiked in
//            if isLiked {
//                FavouritesManager.shared.addFavourite(product: product)
//            } else {
//                FavouritesManager.shared.removeFavourite(product: product)
//            }
//            self?.reloadData()
//        }
//        cell.likeButton.isLiked = FavouritesManager.shared.isFavourite(product: product)
//        return cell
//    }
