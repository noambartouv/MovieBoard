//
//  SearchOption.swift
//  MovieBoard
//
//  Created by Noam Bar-Touv on 30/07/2019.
//  Copyright © 2019 Noam Bar-Touv. All rights reserved.
//

import Foundation

public struct SearchOption {
    var textToDisplay: String
    var urlString: String
    
    init(textToDisplay: String, urlString: String) {
        self.textToDisplay = textToDisplay
        self.urlString = urlString
    }
}
