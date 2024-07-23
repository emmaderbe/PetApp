import Foundation

protocol SearchManagerProtocol {
    func filterProducts(_ products: [DogProductModelDTO], by searchText: String) -> [DogProductModelDTO]
}

class SearchManager: SearchManagerProtocol {
    func filterProducts(_ products: [DogProductModelDTO], by searchText: String) -> [DogProductModelDTO] {
        guard !searchText.isEmpty else { return products }
        return products.filter { $0.product.lowercased().contains(searchText.lowercased()) }
    }
}
