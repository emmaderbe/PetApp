import Foundation

// MARK: - load and parsing JSON-file
struct DogProductLoading {
    func load() -> [DogProduct]? {
            if let url = Bundle.main.url(forResource: "dogProducts", withExtension: "json") {
                do {
                    let data = try Data(contentsOf: url)
                    let jsonDecoder = JSONDecoder()
                    jsonDecoder.dateDecodingStrategy = .iso8601
                    do {
                        return try jsonDecoder.decode([DogProduct].self, from: data)
                    } catch {
                        print("Decoding error: \(error)")
                        return nil
                    }
                } catch {
                    print("error:\(error)")
                }
            }
            return nil
        }
    }

