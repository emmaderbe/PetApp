import Foundation

protocol DogProductDataManagerProtocol {
    func getAllProducts(completion: @escaping ([DogProductModelDTO]) -> Void)
    func getAllProductsTypes(completion: @escaping ([DogProductTypeModelDTO]) -> Void)
    func filterProductsBySearchBar(searchText: String, completion: @escaping ([DogProductModelDTO]) -> Void)
    func filterProductsByCategory(category: String, completion: @escaping ([DogProductModelDTO]) -> Void)
    func resetCategorySearchToAllProducts(completion: @escaping ([DogProductModelDTO]) -> Void)
}

// MARK: - properties and init()
class DogProductDataManager: DogProductDataManagerProtocol {
    private var dogProduct: [DogProductModelDTO] = []
    private var dogProductType: [DogProductTypeModelDTO] = []
    private let networkService: NetworkServiceProtocol
    
    init(networkService: NetworkServiceProtocol = NetworkService()) {
        self.networkService = networkService
    }
}

// MARK: - getAllProducts()
extension DogProductDataManager {
    func getAllProducts(completion: @escaping ([DogProductModelDTO]) -> Void) {
        networkService.fetchResponse { [weak self] result in
            switch result {
            case .success(let dogResponses):
                self?.dogProduct = dogResponses.map { DogProductModelDTO(
                    product: $0.product,
                    type: $0.type,
                    backgroundType: $0.backgroundType,
                    descriptions: $0.descriptions,
                    restriction: $0.restriction,
                    photo: $0.photo,
                    indicator: $0.indicator,
                    detailPhoto: $0.detailPhoto
                )}
                completion(self?.dogProduct ?? [])
            case .failure(let error):
                print("Error fetching products: \(error)")
                completion([])
            }
        }
    }
}

// MARK: - getAllProductsTypes()
extension DogProductDataManager {
    func getAllProductsTypes(completion: @escaping ([DogProductTypeModelDTO]) -> Void) {
        getAllProducts { allProducts in
            var uniqueTypes: [DogProductTypeModelDTO] = []
            var existingTypes: Set<String> = []
            
            for product in allProducts {
                for (index, type) in product.type.enumerated() {
                    if !existingTypes.contains(type) {
                        existingTypes.insert(type)
                        let backgroundType = product.backgroundType[index]
                        let photo = product.photo[index]
                        uniqueTypes.append(DogProductTypeModelDTO(type: type, photo: photo, backgroundType: backgroundType))
                    }
                }
            }
            
            uniqueTypes.sort {
                ($0.type == "Можно" || $0.type == "Нельзя") && !($1.type == "Можно" || $1.type == "Нельзя")
            }
            
            self.dogProductType = uniqueTypes
            completion(uniqueTypes)
        }
    }
}

extension DogProductDataManager {
    func filterProductsBySearchBar(searchText: String, completion: @escaping ([DogProductModelDTO]) -> Void) {
        getAllProducts { products in
            let filteredProducts = searchText.isEmpty ? products : products.filter { $0.product.lowercased().contains(searchText.lowercased()) }
            completion(filteredProducts)
        }
    }
    
    func filterProductsByCategory(category: String, completion: @escaping ([DogProductModelDTO]) -> Void) {
        getAllProducts { products in
            let filteredProducts = category.isEmpty ? products : products.filter { $0.type.contains(category) }
            completion(filteredProducts)
        }
    }
    
    func resetCategorySearchToAllProducts(completion: @escaping ([DogProductModelDTO]) -> Void) {
        getAllProducts { products in
            completion(products)
        }
    }
}
