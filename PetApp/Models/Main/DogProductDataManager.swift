import Foundation

// MARK: - properties and init()
class DogProductDataManager {
    static let shared = DogProductDataManager()
    private var dogProduct: [DogProductModel] = []
    private var dogProductType: [DogProductTypeModel] = []
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

// MARK: - getAllProductsTypes()
extension DogProductDataManager {
    func getAllProductsTypes() -> [DogProductTypeModel] {
        let allProducts = getAllProducts()
        var uniqueTypes: [DogProductTypeModel] = []
        var existingTypes: Set<String> = []
        
        for product in allProducts {
            for (index, type) in product.type.enumerated() {
                if !existingTypes.contains(type) {
                    existingTypes.insert(type)
                    let backgroundType = product.backgroundType[index]
                    let photo = product.photo[index]
                    uniqueTypes.append(DogProductTypeModel(type: type, photo: photo, backgroundType: backgroundType))
                }
            }
        }
        
        uniqueTypes.sort {
            ($0.type == "Можно" || $0.type == "Нельзя") && !($1.type == "Можно" || $1.type == "Нельзя")
        }
        
        self.dogProductType = uniqueTypes
        return dogProductType
    }
}
