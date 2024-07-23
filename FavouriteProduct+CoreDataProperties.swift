import Foundation
import CoreData


extension FavouriteProduct {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FavouriteProduct> {
        return NSFetchRequest<FavouriteProduct>(entityName: "FavouriteProduct")
    }

    @NSManaged public var product: String?
    @NSManaged public var photo: [String]?
    @NSManaged public var indicator: String?
    @NSManaged public var type: [String]?
    @NSManaged public var backgroundType: [String]?
    @NSManaged public var descriptions: String?
    @NSManaged public var restriction: String?
    @NSManaged public var detailPhoto: String?
}

extension FavouriteProduct : Identifiable {

}
