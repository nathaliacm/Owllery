//
//  AlbumModel.swift
//  Owllery
//
//  Created by Nathalia Cardoso on 14/08/20.
//  Copyright © 2020 Nathalia Cardoso. All rights reserved.
//

import Foundation
import UIKit

class AlbumModel: Codable {
    
    var name: String
    var albumImage: Data?
    var collectionImages: [Data?]
    
    init(name: String, albumImage: Data?, collectionImages: [Data?]) {
        self.name = name
        self.albumImage = albumImage
        self.collectionImages = collectionImages
    }
}
