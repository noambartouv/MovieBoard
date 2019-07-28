//
//  Consts.swift
//  MovieBoard
//
//  Created by Noam Bar-Touv on 28/07/2019.
//  Copyright © 2019 Noam Bar-Touv. All rights reserved.
//

import Foundation

public struct Consts {
    
    static let apiKey: String = "b7364d4438c755310cda77571ad8f84a"
    static let queryBaseURL: String = "https://api.themoviedb.org/3"
    static let imageBaseURL: String = "http://image.tmdb.org/t/p/w185//"
    
    // URLS
    static let mostPopularMoviesURL: URL = URL(string: "\(queryBaseURL)/discover/movie?api_key=\(apiKey)&language=en-US&sort_by=popularity.desc&include_adult=false")!
    
    
    
    
}
