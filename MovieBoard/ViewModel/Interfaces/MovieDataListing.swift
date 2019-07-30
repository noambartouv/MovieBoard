//
//  IMovieListManager.swift
//  MovieBoard
//
//  Created by Noam Bar-Touv on 29/07/2019.
//  Copyright © 2019 Noam Bar-Touv. All rights reserved.
//

import Foundation
import UIKit

protocol MovieDataListing {
    var moviesRawData: [MovieQueryResult] { get }
    var moviesImages: [MovieItem] { get }
    
    func emptyList()
    func addMovie(_ newMovie: MovieQueryResult)
    func getMoviesCount() -> Int
    func getMovieImage(index: Int, callbackBlock: @escaping (UIImage) -> ()) -> UIImage
}
