import Foundation

struct DogProductModelDTO {
    let product: String
    let type: [String]
    let backgroundType: [String]
    let descriptions: String
    let restriction: String
    let photo: [String]
    let indicator: String
    let detailPhoto: String
}

struct DogProductTypeModelDTO {
    let type: String
    let photo: String
    let backgroundType: String
}
