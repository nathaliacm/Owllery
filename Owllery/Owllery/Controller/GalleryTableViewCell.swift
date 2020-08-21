//
//  GalleryTableViewCell.swift
//  Owllery
//
//  Created by Nathalia Cardoso on 17/08/20.
//  Copyright © 2020 Nathalia Cardoso. All rights reserved.
//

import UIKit

class GalleryTableViewCell: UITableViewCell {

    let albumImageView: UIImageView = UIImageView()
    let albumNameLabel: UILabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.setUpAlbumImageView()
        self.setUpAlbumNameLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    func set(album: AlbumModel) {
        if let data = album.albumImage {
            albumImageView.image = UIImage(data: data)
        }
        
        albumNameLabel.text = album.name
    }
    
    func setUpAlbumImageView() {
        addSubview(albumImageView)
        
        setUpAlbumImageViewConstraints()
        
        albumImageView.layer.cornerRadius = 40
        albumImageView.clipsToBounds = true
    }
    
    func setUpAlbumNameLabel() {
        addSubview(albumNameLabel)
        
        setUpAlbumNameLabelConstraints()
        
        albumNameLabel.numberOfLines = 0
        albumNameLabel.adjustsFontSizeToFitWidth = true
    }
    
    func setUpAlbumImageViewConstraints() {
        albumImageView.translatesAutoresizingMaskIntoConstraints = false
        
        albumImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        albumImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
        albumImageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        albumImageView.widthAnchor.constraint(equalToConstant: 80).isActive = true
    }
    
    func setUpAlbumNameLabelConstraints() {
        albumNameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        albumNameLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        albumNameLabel.leadingAnchor.constraint(equalTo: albumImageView.trailingAnchor, constant: 20).isActive = true
        albumNameLabel.heightAnchor.constraint(equalToConstant: 80).isActive = true
        albumNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
    }
    
}
