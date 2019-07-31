import UIKit
import Alamofire

class MoviesGridViewController: UIViewController {
    
    private enum Constants {
        static let searchSegue = "SearchSegue"
        static let movieDetialsVC = "MovieDetailsViewController"
        static let movieCell = "MovieCell"
        static let storyName = "Main"
    }
    
    @IBOutlet weak var collectionView: UICollectionView!
    var viewModel: MovieDataListing? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = MovieGridViewModel(movieView: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == Constants.searchSegue, let searchScreen = segue.destination as? SearchScreenViewController else { return }
        searchScreen.selectionDelegate = self
    }
    
}

extension MoviesGridViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        pushMovieDetail(indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        guard let currentDataSize = viewModel?.getMoviesCount() else { return }
        if indexPath.row == currentDataSize - 8 {
            viewModel?.fetchNewPage()
        }
    }
    
}

extension MoviesGridViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.getMoviesCount() ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: MovieGridCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.movieCell, for: indexPath) as! MovieGridCollectionViewCell
        
        if let image = viewModel?.getMovieImage(index: indexPath.row, callbackBlock: { [weak self] serverImage -> Void in
                guard let strongSelf = self else { return }
                cell.movieImage.image = serverImage
            }) {
            cell.movieImage.image = image
        }
        
        return cell
    }
    
}

extension MoviesGridViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenSize = UIScreen.main.bounds
        let screenWidth = screenSize.width
        let cellWidth = screenWidth / 2
        let cellHeight = cellWidth * 1.5027027027
        
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
}

extension MoviesGridViewController: SearchSelectionDelegate {
    
    func didTapChoice(urlString: String) {
        viewModel?.newMovieFetch(urlString: urlString)
    }
    
}

extension MoviesGridViewController: VCDelegate {
    
    func addItemtToView(item: MovieQueryResult) {
        guard let existingItemCount = viewModel?.getMoviesCount() else { return }
        let indexPath = IndexPath(row: existingItemCount - 1, section: 0)
        collectionView.insertItems(at: [indexPath])
    }
    
    func resetViewData() {
        collectionView.reloadData()
    }
    
}

extension MoviesGridViewController {
    func pushMovieDetail(_ index: IndexPath) {
        guard let controller = UIStoryboard(name: Constants.storyName, bundle: nil).instantiateViewController(withIdentifier: Constants.movieDetialsVC) as? MovieDetailsViewController,
            let movie = viewModel?.movieData[index.row]
            else { return }
        
        controller.setup(movie: movie)
        navigationController?.pushViewController(controller, animated: true)
    }
}
