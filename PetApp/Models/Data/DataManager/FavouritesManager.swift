import UIKit
import CoreData

protocol FavouritesManagerProtocol {
    func isFavourite(product: DogProductModelDTO) -> Bool
    func getFavouriteProducts() -> [DogProductModelDTO]
    func addFavourite(product: DogProductModelDTO)
    func removeFavourite(product: DogProductModelDTO)
    func updateFavourite(product: DogProductModelDTO)
}

final class FavouritesManager: FavouritesManagerProtocol {
    
    private let persistenceService: CoreDataPersistenceServiceProtocol
    
    init(persistenceService: CoreDataPersistenceServiceProtocol = CoreDataPersistenceService()) {
        self.persistenceService = persistenceService
    }
}

extension FavouritesManager {
    func isFavourite(product: DogProductModelDTO) -> Bool {
        let fetchRequest: NSFetchRequest<FavouriteProduct> = FavouriteProduct.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "product == %@", product.product)
        
        do {
            let count = try persistenceService.context.count(for: fetchRequest)
            return count > 0
        } catch {
            print("Error fetching data \(error)")
            return false
        }
    }
    
    func getFavouriteProducts() -> [DogProductModelDTO] {
        let fetchRequest: NSFetchRequest<FavouriteProduct> = FavouriteProduct.fetchRequest()
        
        do {
            let favouriteEntities = try persistenceService.context.fetch(fetchRequest)
            return favouriteEntities.map { DogProductModelDTO(product: $0.product ?? "", type: [], backgroundType: [], descriptions: "", restriction: "", photo: [], indicator: "", detailPhoto: "") }
        } catch {
            print("Error fetching data \(error)")
            return []
        }
    }
}

extension FavouritesManager {
    func addFavourite(product: DogProductModelDTO) {
        let entity = FavouriteProduct(context: persistenceService.context)
        entity.product = product.product
        
        persistenceService.saveContext()
    }
    
    func removeFavourite(product: DogProductModelDTO) {
        let fetchRequest: NSFetchRequest<FavouriteProduct> = FavouriteProduct.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "product == %@", product.product)

        do {
            let products = try persistenceService.context.fetch(fetchRequest)
            for product in products {
                persistenceService.context.delete(product)
            }
            persistenceService.saveContext()
        } catch {
            print("Error fetching data \(error)")
        }
    }
    
    func updateFavourite(product: DogProductModelDTO) {
        if isFavourite(product: product) {
            removeFavourite(product: product)
        } else {
            addFavourite(product: product)
        }
    }
}

extension Notification.Name {
    static let dataDidChange = Notification.Name("dataDidChange")
}
