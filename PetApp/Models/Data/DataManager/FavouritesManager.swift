import UIKit
import CoreData

protocol FavouritesManagerProtocol {
    func isFavourite(product: DogProductModelDTO) -> Bool
    func getFavouriteProducts(completion: @escaping ([DogProductModelDTO]) -> Void)
    func addFavourite(product: DogProductModelDTO)
    func removeFavourite(product: DogProductModelDTO)
    func updateFavourite(product: DogProductModelDTO)
}

final class FavouritesManager: FavouritesManagerProtocol {
    private var favouriteDogProduct: [DogProductModelDTO] = []
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
    
    func getFavouriteProducts(completion: @escaping ([DogProductModelDTO]) -> Void) {
        let fetchRequest: NSFetchRequest<FavouriteProduct> = FavouriteProduct.fetchRequest()
        
        do {
            let favouriteEntities = try persistenceService.context.fetch(fetchRequest)
            let favourite = favouriteEntities.map { entity in
                DogProductModelDTO(
                    product: entity.product ?? "",
                    type: entity.type ?? [],
                    backgroundType: entity.backgroundType ?? [],
                    descriptions: entity.descriptions ?? "",
                    restriction: entity.restriction ?? "",
                    photo: entity.photo ?? [],
                    indicator: entity.indicator ?? "",
                    detailPhoto: entity.detailPhoto ?? ""
                )
            }
            completion(favourite)
        } catch {
            print("Error fetching data \(error)")
            completion([])
        }
    }
}

extension FavouritesManager {
    func addFavourite(product: DogProductModelDTO) {
        let entity = FavouriteProduct(context: persistenceService.context)
        entity.product = product.product
        entity.type = product.type
        entity.backgroundType = product.backgroundType
        entity.descriptions = product.descriptions
        entity.restriction = product.restriction
        entity.photo = product.photo
        entity.indicator = product.indicator
        entity.detailPhoto = product.detailPhoto
        persistenceService.saveContext()
        NotificationCenter.default.post(name: .favouritesUpdated, object: nil)
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
            NotificationCenter.default.post(name: .favouritesUpdated, object: nil)
        } catch {
            print("Error fetching data \(error)")
        }
        NotificationCenter.default.post(name: .favouritesUpdated, object: nil)
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
    static let favouritesUpdated = Notification.Name("favouritesUpdated")
}
