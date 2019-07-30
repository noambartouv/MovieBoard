//
//  MovieItem.swift
//  MovieBoard
//
//  Created by Noam Bar-Touv on 29/07/2019.
//  Copyright © 2019 Noam Bar-Touv. All rights reserved.
//

import Foundation
import UIKit

public struct MovieItem {
    var image: UIImage? = nil
    
    mutating func updateImage(newImage: UIImage) {
        self.image = newImage
    }
}
