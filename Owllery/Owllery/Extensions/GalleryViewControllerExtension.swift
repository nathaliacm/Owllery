//
//  GalleryViewControllerExtension.swift
//  Owllery
//
//  Created by Nathalia Cardoso on 18/08/20.
//  Copyright © 2020 Nathalia Cardoso. All rights reserved.
//

import UIKit

extension GalleryViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albuns.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "AlbumCell") as? GalleryTableViewCell else {
            return UITableViewCell()
        }
        
        let album = albuns[indexPath.row]
        cell.set(album: album)
        return cell
    }
    
}
