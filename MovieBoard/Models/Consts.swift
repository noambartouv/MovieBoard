//
//  Consts.swift
//  MovieBoard
//
//  Created by Noam Bar-Touv on 28/07/2019.
//  Copyright © 2019 Noam Bar-Touv. All rights reserved.
//

import Foundation

public struct Consts {
    
    static let imageAspectRation: Double = 1.5027027027 // Width * aspectRatio = Height
    
    static let apiKey: String = "b7364d4438c755310cda77571ad8f84a"
    static let queryBaseURL: String = "https://api.themoviedb.org/3"
    static let imageBaseURL: String = "https://image.tmdb.org/t/p/w185"
    
    // URLS
    static let mostPopularMoviesURL: String = "\(queryBaseURL)/discover/movie?api_key=\(apiKey)&language=en-US&sort_by=popularity.desc&include_adult=false"
    
    static let mostRecentReleasedMoviesURL: String = "\(queryBaseURL)/discover/movie?api_key=\(apiKey)&language=en-US&sort_by=release_date.desc&include_adult=false"
    
    static let topRatedMoviesURL: String = "\(queryBaseURL)/discover/movie?api_key=\(apiKey)&language=en-US&sort_by=vote_average.desc&include_adult=false"
    
    static func withKeywordURL(query: String) -> String {
        return "\(queryBaseURL)/search/movie?api_key=\(apiKey)&language=en-US&&query=\(query)&include_adult=false"
    }
    
}
