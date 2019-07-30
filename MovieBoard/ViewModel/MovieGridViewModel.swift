//
//  MovieListManager.swift
//  MovieBoard
//
//  Created by Noam Bar-Touv on 28/07/2019.
//  Copyright © 2019 Noam Bar-Touv. All rights reserved.
//

import Foundation
import UIKit

class MovieGridViewModel {
    
    var movieView: IMoviesView? = nil
    
    var moviesRawData: [MovieQueryResult] = Array() {
        didSet { print("Didset") }
    }
    
    var moviesImages: [MovieItem] = Array() {
        didSet { print("LALALAL") }
    }
    
    init(movieView: IMoviesView?) {
        self.movieView = movieView
        NetworkManager.instance.movieDataList = self
        NetworkManager.instance.searchForMovies(URLstring: Consts.mostPopularMoviesURL)
    }

}

extension MovieGridViewModel : MovieDataListing {
    
    func addMovie(_ newMovie: MovieQueryResult) {
        print("added \(newMovie.title)")
        moviesRawData.append(newMovie)
        moviesImages.append(MovieItem())
        movieView?.addItemtToView(item: newMovie)
    }
    
    func emptyList() {
        print("RESET LIST")
        moviesRawData = Array()
    }
    
    func getMoviesCount() -> Int {
        return moviesRawData.count
    }
    
    func getMovieImage(index: Int, callbackBlock: @escaping (UIImage) -> ()) -> UIImage {
        guard let movie = moviesImages[index].image else {
            let imageURL = "\(Consts.imageBaseURL)\(moviesRawData[index].poster_path)"
            NetworkManager.instance.retrieveMovieImage(URLstring: imageURL, responseBlock: { [weak self] image -> Void in
                guard let _ = self, let safeImage = image else { return }
                self?.moviesImages[index].updateImage(newImage: safeImage)
                callbackBlock(safeImage)
            })
            return UIImage(named: "Dog")!
        }
        return movie

    }
    
}
