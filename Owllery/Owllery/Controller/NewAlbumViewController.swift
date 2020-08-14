//
//  NewAlbumViewController.swift
//  Owllery
//
//  Created by Nathalia Cardoso on 14/08/20.
//  Copyright © 2020 Nathalia Cardoso. All rights reserved.
//

import UIKit

class NewAlbumViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Novo Álbum"
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Salvar", style: .plain, target: self, action: nil)
    }

}
