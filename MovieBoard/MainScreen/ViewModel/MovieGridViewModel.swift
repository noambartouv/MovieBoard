import Foundation
import UIKit

class MovieGridViewModel {
    
    weak var vcDelegate: VCDelegate? = nil
    var moviesRawData: [MovieQueryResult] = Array()
    var movieData: [MovieItem] = Array()
    var currentLastPageLoaded = 0
    var currentSearchUrl: String? = nil
    
    init(movieView: VCDelegate?) {
        vcDelegate = movieView
        newMovieFetch(urlString: Consts.mostPopularMoviesURL)
    }
    
    private func updateCachedData(movies: [MovieQueryResult]) -> () {
        for movieResult in movies {
            self.addMovie(movieResult)
        }
    }
}

extension MovieGridViewModel : MovieDataListing {
    
    func newMovieFetch(urlString: String) {
        resetAllValues(urlString: urlString)
        NetworkManager.shared.searchForMovies(URLstring:urlString, responseBlock: { [weak self] movies in
            self?.updateCachedData(movies: movies)
        })
    }
    
    private func resetAllValues(urlString: String) {
        currentLastPageLoaded = 1
        currentSearchUrl = urlString
        self.emptyMovies()
        vcDelegate?.resetViewData()
    }
    
    func fetchNewPage() {
        guard let urlString: String = self.currentSearchUrl else { return }
        currentLastPageLoaded += 1
        let newUrl = urlString + String("&page=\(currentLastPageLoaded)")
        NetworkManager.shared.searchForMovies(URLstring: newUrl, responseBlock: { [weak self] movies in
            self?.updateCachedData(movies: movies)
        })
    }
    
    func addMovie(_ newMovie: MovieQueryResult) {
        print("added \(newMovie.title)")
        moviesRawData.append(newMovie)
        movieData.append(MovieItem(movieRawData: newMovie))
        vcDelegate?.addItemtToView(item: newMovie)
    }
    
    func emptyMovies() {
        print("RESET LIST")
        moviesRawData = Array()
        movieData = Array()
    }
    
    func getMoviesCount() -> Int {
        return moviesRawData.count
    }
    
    func getMovieImage(index: Int, callbackBlock: @escaping (UIImage) -> ()) -> UIImage {
        guard let movie = movieData[index].image else {
            retrieveImageFromServer(index: index, callbackBlock: callbackBlock)
            return UIImage(named: "PlaceHolder")!
        }
        return movie
    }
    
    func getMovieTitle(index: Int) -> String {
        return moviesRawData[index].title
    }
    
    private func retrieveImageFromServer(index: Int, callbackBlock: @escaping (UIImage) -> ()) -> Void {
        guard let posterPath = moviesRawData[index].poster_path else { return }
        let imageURL = "\(Consts.imageBaseURL)\(posterPath)"
        NetworkManager.shared.retrieveMovieImage(URLstring: imageURL, responseBlock: { [weak self] image -> Void in
            guard let _ = self, let safeImage = image else { return }
            self?.movieData[index].setImage(newImage: safeImage)
            callbackBlock(safeImage)
        })
    }
}

protocol VCDelegate: class {
    func addItemtToView(item: MovieQueryResult)
    func resetViewData()
}
