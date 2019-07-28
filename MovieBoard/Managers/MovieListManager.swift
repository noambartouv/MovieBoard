//
//  MovieListManager.swift
//  MovieBoard
//
//  Created by Noam Bar-Touv on 28/07/2019.
//  Copyright © 2019 Noam Bar-Touv. All rights reserved.
//

import Foundation

class MovieListManager {
    
    static var instance: MovieListManager = MovieListManager()
    
//    public static func getInstance() -> MovieListManager {
//        if MovieListManager.instance != nil {
//            MovieListManager.instance = MovieListManager()
//        }
//
//        return MovieListManager.instance
//    }
    
    var movieList: Dictionary<String,MovieQueryResult> = Dictionary()
    
    func addMovie(_ newMovie: MovieQueryResult) {
        movieList[newMovie.title] = newMovie
    }
    
    func emptyList() {
        movieList = Dictionary()
    }
    
//    let encoder = JSONEncoder()
//    encoder.outputFormatting = .prettyPrinted
//
//    do {
//    let jsonData = try encoder.encode(user)
//
//    if let jsonString = String(data: jsonData, encoding: .utf8) {
//    print(jsonString)
//    }
//    } catch {
//    print(error.localizedDescription)
//    }
    
    
}
