import Foundation

// MARK: - properties and init()
class DogProductDataManager {
    static let shared = DogProductDataManager()
    private var dogProduct: [DogProduct] = []
    private let storage = DogProductLoading()

    private init() {
        loadProducts()
    }
}

// MARK: - loadProducts()
extension DogProductDataManager {
    func loadProducts() {
        dogProduct = storage.load() ?? []
    }
}

// MARK: - getAllProducts()
extension DogProductDataManager {
    func getAllProducts() -> [DogProduct] {
        return dogProduct
    }
}

// MARK: - getFavouriteProducts()
extension DogProductDataManager {
    func getFavouriteProducts() -> [DogProduct] {
        return dogProduct.filter { FavouritesManager.shared.isFavourite(product: $0) }
    }

}



