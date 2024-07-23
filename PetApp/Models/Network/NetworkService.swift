import Foundation

protocol NetworkServiceProtocol {
    func fetchResponse(completion: @escaping (Result<[DogResponse], Error>) -> Void)
}

enum NetworkError: Error {
    case invalidURL
    case decodingError
}

// MARK: - load and parsing JSON-file
final class NetworkService: NetworkServiceProtocol {
    func fetchResponse(completion: @escaping (Result<[DogResponse], any Error>) -> Void) {
        guard let url = Bundle.main.url(forResource: "dogProducts", withExtension: "json") else {
            completion(.failure(NetworkError.invalidURL))
            return
        }
        
        DispatchQueue.global().async {
            do {
                let data = try Data(contentsOf: url)
                let jsonDecoder = JSONDecoder()
                jsonDecoder.dateDecodingStrategy = .iso8601
                let response = try jsonDecoder.decode([DogResponse].self, from: data)
                DispatchQueue.main.async {
                    completion(.success(response))
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(NetworkError.decodingError))
                }
            }
        }
    }
}

