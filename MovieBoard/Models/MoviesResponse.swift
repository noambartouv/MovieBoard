//
//  MoviesResponse.swift
//  MovieBoard
//
//  Created by Noam Bar-Touv on 28/07/2019.
//  Copyright © 2019 Noam Bar-Touv. All rights reserved.
//

import Foundation

public struct MoviesResponse: Codable {
    public let page: Int
    public let total_results: Int
    public let total_pages: Int
    public let results: [MovieQueryResult]
}
