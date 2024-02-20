import UIKit

// MARK: - Properties for functional of likeBotton
class FavouritesManager {
    static let shared = FavouritesManager()
    var favourites: [DogProductModel] = []
}

// MARK: - isFavourite()
extension FavouritesManager {
    func isFavourite(product: DogProductModel) -> Bool {
        return favourites.contains(where: { $0.product == product.product })
    }
}

// MARK: - addFavourite()
extension FavouritesManager {
    func addFavourite(product: DogProductModel) {
        if !isFavourite(product: product) {
            favourites.append(product)
        }
    }
}

// MARK: - removeFavourite()
extension FavouritesManager {
    func removeFavourite(product: DogProductModel) {
        if let index = favourites.firstIndex(of: product) {
            favourites.remove(at: index)
        }
    }
}

// MARK: - updateFavourite()
extension FavouritesManager {
    func updateFavourite(product: DogProductModel) {
        if isFavourite(product: product) {
            removeFavourite(product: product)
        } else {
            addFavourite(product: product)
        }
    }
}
