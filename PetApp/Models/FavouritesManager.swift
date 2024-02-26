import UIKit
import CoreData

// MARK: - Properties
class FavouritesManager {
    static let shared = FavouritesManager()

    private var context: NSManagedObjectContext {
        return (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    }
}

// MARK: - isFavourite()
extension FavouritesManager {
    func isFavourite(product: DogProductModel) -> Bool {
        let fetchRequest: NSFetchRequest<FavouriteProduct> = FavouriteProduct.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "product == %@", product.product)
        
        do {
            let count = try context.count(for: fetchRequest)
            return count > 0
        } catch {
            print("Error fetching data \(error)")
            return false
        }
    }

}

// MARK: - addFavourite()
extension FavouritesManager {
    func addFavourite(product: DogProductModel) {
        let entity = FavouriteProduct(context: context)
        entity.product = product.product
        
        do {
            try context.save()
        } catch {
            print("Failed to save favourite: \(error)")
        }
    }
}

// MARK: - removeFavourite()
extension FavouritesManager {
    func removeFavourite(product: DogProductModel) {
        let fetchRequest: NSFetchRequest<FavouriteProduct> = FavouriteProduct.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "product == %@", product.product)

        do {
            let products = try context.fetch(fetchRequest)
            for product in products {
                context.delete(product)
            }
            try context.save()
        } catch {
            print("Error fetching data \(error)")
        }
    }

}

// MARK: - updateFavourite()
extension FavouritesManager {
    func updateFavourite(product: DogProductModel) {
        if isFavourite(product: product) {
            removeFavourite(product: product)
        } else {
            addFavourite(product: product)
        }
    }
}
