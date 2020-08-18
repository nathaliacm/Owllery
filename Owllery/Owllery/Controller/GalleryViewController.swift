//
//  ListaAlbunsViewController.swift
//  Owllery
//
//  Created by Nathalia Cardoso on 14/08/20.
//  Copyright © 2020 Nathalia Cardoso. All rights reserved.
//

import UIKit

class GalleryViewController: UIViewController {

    let tableView: UITableView = UITableView()
    var albuns: [AlbumModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Owllery"
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Novo Álbum", style: .plain, target: self, action: #selector(GalleryViewController.newAlbumButtonItemTapped(_:)))
        
        let testeAlbum = AlbumModel(name: "Teste", albumImage: UIImage(named: "test"), collectionImages: [UIImage(named: "test")])
        albuns.append(testeAlbum)
        setUpTableView()
    }
    
    func setUpTableView() {
        view.addSubview(tableView)
        setTableViewDelegates()
        tableView.rowHeight = 100
        tableView.register(GalleryTableViewCell.self, forCellReuseIdentifier: "AlbumCell")
        tableView.pin(to: view)
    }
    
    func setTableViewDelegates() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    @objc func newAlbumButtonItemTapped(_ sender: UIBarButtonItem!) {
        self.navigationController?.pushViewController(NewAlbumViewController(), animated: true)
    }

}
