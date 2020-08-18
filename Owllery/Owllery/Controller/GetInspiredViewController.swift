//
//  GetInspiredViewController.swift
//  Owllery
//
//  Created by Nathalia Cardoso on 14/08/20.
//  Copyright © 2020 Nathalia Cardoso. All rights reserved.
//

import UIKit

class GetInspiredViewController: UIViewController {
    
    var photoGridCollectionView: UICollectionView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Inspirações"
        
        setUpCollectionview()
    }

    func setUpCollectionview() {
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: (view.frame.width/2) - 15, height: 250)
        
        photoGridCollectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        
        view.addSubview(photoGridCollectionView ?? UICollectionView())
        setCollectionViewDelegates()
        
        photoGridCollectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "MyCell")
        photoGridCollectionView?.backgroundColor = .systemFill
    }
    
    func setCollectionViewDelegates() {
        photoGridCollectionView?.delegate = self
        photoGridCollectionView?.dataSource = self
    }
}
