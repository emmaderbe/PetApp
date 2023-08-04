import UIKit

// MARK: - Properties for functional of likeBotton
class FavouritesManager {
    static let shared = FavouritesManager()
    var favourites: [DogProduct] = []
}

// MARK: - isFavourite()
extension FavouritesManager {
    func isFavourite(product: DogProduct) -> Bool {
        return favourites.contains(where: { $0.product == product.product })
    }
}

// MARK: - addFavourite()
extension FavouritesManager {
    func addFavourite(product: DogProduct) {
        if !isFavourite(product: product) {
            favourites.append(product)
        }
    }
}

// MARK: - removeFavourite()
extension FavouritesManager {
    func removeFavourite(product: DogProduct) {
        if let index = favourites.firstIndex(of: product) {
            favourites.remove(at: index)
        }
    }
}

// MARK: - updateFavourite()
extension FavouritesManager {
    func updateFavourite(product: DogProduct) {
        if isFavourite(product: product) {
            removeFavourite(product: product)
        } else {
            addFavourite(product: product)
        }
    }
}
