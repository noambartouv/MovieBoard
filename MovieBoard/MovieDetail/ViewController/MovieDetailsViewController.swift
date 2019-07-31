//
//  MovieDetailsViewController.swift
//  MovieBoard
//
//  Created by Noam Bar-Touv on 31/07/2019.
//  Copyright © 2019 Noam Bar-Touv. All rights reserved.
//

import Foundation
import UIKit

class MovieDetailsViewController: UIViewController {
    
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var descriptionText: UILabel!
    
    var movie: MovieItem?
    
    func setup(movie: MovieItem) {
        self.movie = movie
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        movieTitle.text = movie?.title
        movieImage.image = movie?.image
        descriptionText.text = movie?.overview
    }
    
}
