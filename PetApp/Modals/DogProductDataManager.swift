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
        let products = storage.load() ?? []
        dogProduct = products
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

//// MARK: - filterProducts()
//extension DogProductDataManager {
//    func filterProducts(by searchText: String) -> [DogProduct] {
//        return dogProduct.filter { product in
//            return product.product.lowercased().contains(searchText.lowercased())
//        }
//    }
//}



