import Foundation

struct DogProductStorage {
    func load() -> [DogProduct]? {
            if let url = Bundle.main.url(forResource: "dogProducts", withExtension: "json") {
                do {
                    let data = try Data(contentsOf: url)
                    let jsonDecoder = JSONDecoder()
                    jsonDecoder.dateDecodingStrategy = .iso8601
                    return try! jsonDecoder.decode([DogProduct].self, from: data)
                } catch {
                    print("error:\(error)")
                }
            }
            return nil
        }
    }
