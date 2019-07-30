//
//  ViewController.swift
//  MovieBoard
//
//  Created by Noam Bar-Touv on 25/07/2019.
//  Copyright © 2019 Noam Bar-Touv. All rights reserved.
//

import UIKit
import Alamofire

class MoviesGridViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var viewModel: MovieDataListing? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        viewModel = MovieGridViewModel(movieView: self)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.getMoviesCount() ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: MovieGridCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCell", for: indexPath) as! MovieGridCollectionViewCell
        
        if let image = viewModel?.getMovieImage(index: indexPath.row, callbackBlock: { [weak self] serverImage -> Void in
            guard let strongSelf = self else { return }
            cell.movieImage.image = serverImage
        }) {
            cell.movieImage.image = image
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("wow")
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenSize = UIScreen.main.bounds
        let screenWidth = screenSize.width
        let cellWidth = screenWidth / 2
        let cellHeight = cellWidth * 1.5027027027
        
        return CGSize(width: cellWidth, height: cellHeight)
    }

}

extension MoviesGridViewController: IMoviesView {
    
    func addItemtToView(item: MovieQueryResult) {
        guard let existingItemCount = viewModel?.getMoviesCount() else { return }
        let indexPath = IndexPath(row: existingItemCount - 1, section: 0)
        collectionView.insertItems(at: [indexPath])
    }
    
}

