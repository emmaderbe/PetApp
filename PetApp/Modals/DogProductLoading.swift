import Foundation

// MARK: - load and parsing JSON-file
struct DogProductLoading {
    func load() -> [DogProduct]? {
        guard let url = Bundle.main.url(forResource: "dogProducts", withExtension: "json") else {
                    print("Error: Unable to find JSON file.")
                    return nil
                }
                
                do {
                    let data = try Data(contentsOf: url)
                    let jsonDecoder = JSONDecoder()
                    jsonDecoder.dateDecodingStrategy = .iso8601
                    return try jsonDecoder.decode([DogProduct].self, from: data)
                } catch {
                    print("Error loading and decoding data: \(error)")
                    return nil
                }
        }
    }

