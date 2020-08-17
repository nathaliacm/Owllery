//
//  AlbumModel.swift
//  Owllery
//
//  Created by Nathalia Cardoso on 14/08/20.
//  Copyright © 2020 Nathalia Cardoso. All rights reserved.
//

import Foundation
import UIKit

class AlbumModel {
    
    var name: String
    var albumImage: UIImage
    var collectionImages: [UIImage]
    
    init(name: String, albumImage: UIImage, collectionImages: [UIImage]) {
        self.name = name
        self.albumImage = albumImage
        self.collectionImages = collectionImages
    }
}
