import Foundation
import Alamofire

class NetworkManager {
    
    static var shared: NetworkManager = NetworkManager()
    
    private let jsonDecoder: JSONDecoder = {
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-mm-dd"
        jsonDecoder.dateDecodingStrategy = .formatted(dateFormatter)
        return jsonDecoder
    }()
    
    func searchForMovies(URLstring: String, responseBlock: @escaping ([MovieQueryResult]) -> ()) {
        Alamofire.request(URL(string: "\(URLstring)")!)
            .validate()
            .response { (response) in
                if let data = response.data {
                    do {
                        let decoder = JSONDecoder()
                        let moviesResponse = try decoder.decode(MoviesResponse.self, from: data)
                        responseBlock(moviesResponse.results)
                    } catch {
                        print("Error: ", error)
                    }
                }
        }
    }
    
    func retrieveMovieImage(URLstring: String, responseBlock: @escaping (UIImage?) -> ()) {
        Alamofire.request(URLstring, method: .get).responseData { response in
            guard let data = response.result.value else { return }
            let image = UIImage(data: data)
            responseBlock(image)
        }
    }
    
}
