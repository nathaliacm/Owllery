//
//  Photo.swift
//  Owllery
//
//  Created by Nathalia Cardoso on 18/08/20.
//  Copyright © 2020 Nathalia Cardoso. All rights reserved.
//

import Foundation

struct Photo: Identifiable, Decodable, Hashable {
    
    var id: String
    var urls: [String: String]
}
