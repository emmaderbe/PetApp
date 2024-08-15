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
    
    func numberOfItems(in section: Int) -> Int {
        return dogProductList.count
    }
    
    func isEmpty() -> Bool {
        if !dogProductList.isEmpty {
            return false
        }
        return true
    }
}

extension FoodCollectionDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard indexPath.row < dogProductList.count else {
            print("Index out of range")
            return UICollectionViewCell()
        }
        
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
