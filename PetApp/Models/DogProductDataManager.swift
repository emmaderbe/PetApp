import Foundation

// MARK: - properties and init()
class DogProductDataManager {
    static let shared = DogProductDataManager()
    private var dogProduct: [DogProductModel] = []
    private var dogProductType: [DogProductTypeModel] = []
//    private var dogProductType: [String] = []
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
    func getAllProductsTypes() -> [DogProductTypeModel] {
        let allProducts = getAllProducts()
        var uniqueTypes: [DogProductTypeModel] = []
        var existingTypes: Set<String> = []
        
        for product in allProducts {
            if !existingTypes.contains(product.type) {
                existingTypes.insert(product.type)
                uniqueTypes.append(DogProductTypeModel(type: product.type, photo: product.photo))
            }
        }
        self.dogProductType = uniqueTypes
        return dogProductType
    }
}

//extension DogProductDataManager {
//    func getAllProductTypes() -> [String] {
//        let allProducts = getAllProducts()
//        var uniqueTypes: Set<String> = []
//
//        for product in allProducts {
//            uniqueTypes.insert(product.type)
//        }
//        
//        return Array(uniqueTypes)
//    }
//}
