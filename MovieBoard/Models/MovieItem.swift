//
//  MovieItem.swift
//  MovieBoard
//
//  Created by Noam Bar-Touv on 29/07/2019.
//  Copyright © 2019 Noam Bar-Touv. All rights reserved.
//

import Foundation
import UIKit

public struct MovieItem {
    
    var title: String
    var image: UIImage? = nil
    var overview: String
    var voteAverageScore: Double
    var language: String
    var releaseDate: String
    
    mutating func setImage(newImage: UIImage) {
        self.image = newImage
    }
    
    init(movieRawData: MovieQueryResult) {
        self.title = movieRawData.title
        self.overview = movieRawData.overview
        self.voteAverageScore = movieRawData.vote_average
        self.language = movieRawData.original_language
        self.releaseDate = movieRawData.release_date
        
    }
}
