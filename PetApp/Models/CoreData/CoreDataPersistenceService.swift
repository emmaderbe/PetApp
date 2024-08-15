import CoreData
import UIKit

protocol CoreDataPersistenceServiceProtocol {
    var context: NSManagedObjectContext { get }
    func saveContext()
}

final class CoreDataPersistenceService: CoreDataPersistenceServiceProtocol {
    var context: NSManagedObjectContext {
        return (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    }
    
    func saveContext() {
        do {
            try context.save()
            NotificationCenter.default.post(name: .dataDidChange, object: nil)
        } catch {
            print("Error saving context: \(error)")
        }
    }
}
