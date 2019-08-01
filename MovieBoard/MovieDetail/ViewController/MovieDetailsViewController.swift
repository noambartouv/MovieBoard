import Foundation
import UIKit

class MovieDetailsViewController: UIViewController {
    
    enum Constants {
        static let notAvialable = "N\\A"
    }
    
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var descriptionText: UILabel!
    @IBOutlet weak var rating: UILabel!
    @IBOutlet weak var releaseDate: UILabel!
    @IBOutlet weak var language: UILabel!
    
    var movie: MovieItem?
    
    func setup(movie: MovieItem) {
        self.movie = movie
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        movieTitle.text = movie?.title
        movieImage.image = movie?.image
        descriptionText.text = movie?.overview
        releaseDate.text = movie?.releaseDate
        language.text = movie?.language
        if let movieScore = movie?.voteAverageScore {
            rating.text = "\(movieScore)/10"
        } else {
            rating.text = Constants.notAvialable
        }
    }
    
}
