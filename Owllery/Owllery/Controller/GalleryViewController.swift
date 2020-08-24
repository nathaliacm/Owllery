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
    var currentItem = AlbumModel(name: "", albumImage: nil, collectionImages: [])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Owllery"
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Novo Álbum", style: .plain, target: self, action: #selector(GalleryViewController.newAlbumButtonItemTapped(_:)))
        
        let testeAlbum = AlbumModel(name: "Teste", albumImage: UIImage(named: "test")?.pngData(), collectionImages: [UIImage(named: "test")?.pngData()])
        
        albuns.append(testeAlbum)
        
        if let albuns = LoaderJson().load() {
            self.albuns = albuns
        }
            
        setUpTableView()
        tableView.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if let albuns = LoaderJson().load() {
            self.albuns = albuns
        }
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.currentItem = albuns[indexPath.row] //seta o objeto item que vai ser passado pra descrição
        tableView.deselectRow(at: indexPath, animated: true)
        let viewController = AlbumViewController()
        viewController.currentItem = currentItem
        self.navigationController?.pushViewController(viewController, animated: true)
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
