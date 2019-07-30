//
//  IMoviesView.swift
//  MovieBoard
//
//  Created by Noam Bar-Touv on 29/07/2019.
//  Copyright © 2019 Noam Bar-Touv. All rights reserved.
//

import Foundation

protocol IMoviesView {
    func addItemtToView(item: MovieQueryResult)
}
