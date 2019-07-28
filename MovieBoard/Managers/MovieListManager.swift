//
//  MovieListManager.swift
//  MovieBoard
//
//  Created by Noam Bar-Touv on 28/07/2019.
//  Copyright © 2019 Noam Bar-Touv. All rights reserved.
//

import Foundation

struct MovieListManager {
    
    var movieList: Dictionary<String,MovieQueryResult> = Dictionary()
    
    mutating func addMovie(_ newMovie: MovieQueryResult) {
        movieList[newMovie.title] = newMovie
    }
    
    mutating func emptyList() {
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
