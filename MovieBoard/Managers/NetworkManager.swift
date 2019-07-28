//
//  NetworkManager.swift
//  MovieBoard
//
//  Created by Noam Bar-Touv on 28/07/2019.
//  Copyright © 2019 Noam Bar-Touv. All rights reserved.
//

import Foundation

class NetworkManager {
    
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
    
    
}
