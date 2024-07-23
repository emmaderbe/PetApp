import Foundation

// MARK: - JSON properties
struct DogResponse: Codable, Hashable {
    let product: String
    let type: [String]
    let backgroundType: [String]
    let descriptions: String
    let restriction: String
    let photo: [String]
    let indicator: String
    let detailPhoto: String
}
