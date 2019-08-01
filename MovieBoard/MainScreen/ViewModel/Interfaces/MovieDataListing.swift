import Foundation
import UIKit

protocol MovieDataListing {
    var moviesRawData: [MovieQueryResult] { get }
    var movieData: [MovieItem] { get }
    
    func emptyMovies()
    func addMovie(_ newMovie: MovieQueryResult)
    func getMoviesCount() -> Int
    func getMovieImage(index: Int, callbackBlock: @escaping (UIImage) -> ()) -> UIImage
    func getMovieTitle(index: Int) -> String
    func newMovieFetch(urlString: String)
    func fetchNewPage()
}
