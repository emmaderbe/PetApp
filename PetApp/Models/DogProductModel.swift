import Foundation

// MARK: - JSON properties
struct DogProductModel: Codable, Hashable {
    let product: String
    let type: String
    let descriptions: String
    let restriction: String
    let photo: String
    let indicator: String
}


