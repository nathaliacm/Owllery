//
//  PhotoCustomCell.swift
//  Owllery
//
//  Created by Nathalia Cardoso on 18/08/20.
//  Copyright © 2020 Nathalia Cardoso. All rights reserved.
//

import UIKit

class PhotoCustomCell: UICollectionViewCell {
    
    var photo: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 12
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        contentView.addSubview(photo)
        
        photo.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        photo.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        photo.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        photo.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
