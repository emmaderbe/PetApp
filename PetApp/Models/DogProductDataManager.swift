import Foundation

// MARK: - properties and init()
class DogProductDataManager {
    static let shared = DogProductDataManager()
    private var dogProduct: [DogProductModel] = []
    private var dogProductType: [DogProductModel] = []
    private let storage = NetworkingService()
    
    private init() {
        loadProducts()
    }
}

// MARK: - loadProducts()
extension DogProductDataManager {
    func loadProducts() {
        dogProduct = storage.loadAndParseJSON() ?? []
    }
}

// MARK: - getAllProducts()
extension DogProductDataManager {
    func getAllProducts() -> [DogProductModel] {
        return dogProduct
    }
}

// MARK: - getFavouriteProducts()
extension DogProductDataManager {
    func getFavouriteProducts() -> [DogProductModel] {
        return dogProduct.filter { FavouritesManager.shared.isFavourite(product: $0) }
    }
}

extension DogProductDataManager {
    func getAllProductsTypes() -> [DogProductModel] {
        let allProducts = getAllProducts()
        var uniqueTypes: [DogProductModel] = []
        var existingTypes: Set<String> = []
        
        for product in allProducts {
            if !existingTypes.contains(product.type) {
                existingTypes.insert(product.type)
                uniqueTypes.append(product)
            }
        }
        self.dogProductType = uniqueTypes
        return dogProductType
    }
}



