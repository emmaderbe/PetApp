import Foundation

// MARK: - JSON properties
struct DogProduct: Codable, Hashable {
    var product: String
    var type: String
    var descriptions: String
    var restriction: String
    var photo: String
    var indicator: String
}


