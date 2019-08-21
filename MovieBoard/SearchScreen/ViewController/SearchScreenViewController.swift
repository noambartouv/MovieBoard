import Foundation
import UIKit

class SearchScreenViewController: UIViewController, UISearchBarDelegate {
    
    enum Constants {
        static let searchOptioncell = "SearchOptionCell"
    }
    
    weak var selectionDelegate: SearchSelectionDelegate? = nil
    var searchOptions: [SearchOption] =
        [SearchOption(textToDisplay: "Most Popular", urlString: Consts.mostPopularMoviesURL),
         SearchOption(textToDisplay: "Most Recent Releases", urlString: Consts.mostRecentReleasedMoviesURL),
         SearchOption(textToDisplay: "Top Rated", urlString: Consts.topRatedMoviesURL)]
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let query = searchBar.text else { return }
        let urlString = Consts.withKeywordURL(query: query)
        selectionDelegate?.didTapChoice(urlString: urlString)
        navigationController?.popViewController(animated: true)
    }
    
    func searchBar(_ searchBar: UISearchBar, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        let totalCharacters = (searchBar.text?.appending(text).count ?? 0) - range.length
        return totalCharacters <= 8    }
}

extension SearchScreenViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectionDelegate?.didTapChoice(urlString: searchOptions[indexPath.row].urlString)
        navigationController?.popViewController(animated: true)
    }
}

extension SearchScreenViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchOptions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.searchOptioncell, for: indexPath) as! SearchOptionViewCell
        cell.searchLabel.text = searchOptions[indexPath.row].textToDisplay
        return cell
    }
}

protocol SearchSelectionDelegate: class {
    func didTapChoice(urlString: String)
}
