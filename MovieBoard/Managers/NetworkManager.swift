//
//  NetworkManager.swift
//  MovieBoard
//
//  Created by Noam Bar-Touv on 28/07/2019.
//  Copyright © 2019 Noam Bar-Touv. All rights reserved.
//

import Foundation
import Alamofire

class NetworkManager {
    
    static var instance: NetworkManager = NetworkManager()
    var movieDataList: MovieDataListing? = nil
    
//    public static func getInstance() -> NetworkManager {
//        if NetworkManager.instance != nil {
//            NetworkManager.instance = NetworkManager()
//        }
//
//        return NetworkManager.instance as! NetworkManager
//    }
    
    private let jsonDecoder: JSONDecoder = {
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-mm-dd"
        jsonDecoder.dateDecodingStrategy = .formatted(dateFormatter)
        return jsonDecoder
    }()
    
    
//    let task = URLSession.shared.dataTask(with: Consts.mostPopularMoviesURL) { (data, response, error) in
//        guard let dataResponse = data, error == nil else {
//            print(error ?? "Response Error")
//            return
//        }
//
//        do {
//            let jsonResponse = try JSONSerialization.data(withJSONObject: dataResponse, options: [])
//            print(jsonResponse)
//        } catch let parsingError {
//            print("Error", parsingError)
//        }
//
//    }
//    task.resume()
    
    func searchForMovies(URLstring: String) {
        Alamofire.request(URL(string: "\(URLstring)")!)
            .validate()
            .response { (response) in
                
                print("Request: \(String(describing: response.request))")
                print("Response: \(String(describing: response.response))")
                print("Error: \(String(describing: response.error))")
                
                if let data = response.data {
                    do {
                        let decoder = JSONDecoder()
                        let moviesResponse = try decoder.decode(MoviesResponse.self, from: data)
                        self.populateMoviesManager(moviesResponse: moviesResponse)
                    } catch {
                        print("Error: ", error)
                    }
                }
        }
    }
    
    func retrieveMovieImage(URLstring: String, responseBlock: @escaping (UIImage?) -> ()) {
        Alamofire.request(URLstring, method: .get).responseData { response in
            guard let data = response.result.value else { return }
            if let data = response.result.value {
                let image = UIImage(data: data)
                responseBlock(image)
            }
        }
    }
    
    private func populateMoviesManager(moviesResponse: MoviesResponse) {
        movieDataList?.emptyList()
        for movieResult in moviesResponse.results {
            movieDataList?.addMovie(movieResult)
        }
    }
    
    
}
