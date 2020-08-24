//
//  ShowPhotoViewController.swift
//  Owllery
//
//  Created by Nathalia Cardoso on 23/08/20.
//  Copyright © 2020 Nathalia Cardoso. All rights reserved.
//

import UIKit

class ShowPhotoViewController: UIViewController {

    var image = UIImageView()
    var photo: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        self.setUpImage()
    }
    
    func setUpImage() {
        image.image = photo
        
        self.view.addSubview(image)
        
        self.setupImageConstraints()
        
        image.contentMode = UIView.ContentMode.scaleAspectFill
        image.layer.cornerRadius = 12
        image.clipsToBounds = true
    }
    
    func setupImageConstraints() {
        image.translatesAutoresizingMaskIntoConstraints = false
        
        image.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        image.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        image.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -40).isActive = true
        image.heightAnchor.constraint(equalToConstant: 500).isActive = true
    }

}
