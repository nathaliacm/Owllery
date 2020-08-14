//
//  ListaAlbunsViewController.swift
//  Owllery
//
//  Created by Nathalia Cardoso on 14/08/20.
//  Copyright © 2020 Nathalia Cardoso. All rights reserved.
//

import UIKit

class GalleryViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Owllery"
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Novo Álbum", style: .plain, target: self, action: #selector(GalleryViewController.newAlbumButtonItemTapped(_:)))
    }
    
    @objc func newAlbumButtonItemTapped(_ sender: UIBarButtonItem!) {
        self.navigationController?.pushViewController(NewAlbumViewController(), animated: true)
    }

}
