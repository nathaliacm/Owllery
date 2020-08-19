//
//  GetInspiredViewControllerExtension.swift
//  Owllery
//
//  Created by Nathalia Cardoso on 18/08/20.
//  Copyright © 2020 Nathalia Cardoso. All rights reserved.
//

import UIKit

extension GetInspiredViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let count = UserDefaults.standard.object(forKey: "photosCount") as? Int else { return 0 }
        return count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath) as? PhotoCustomCell else {
            return UICollectionViewCell()
        }
        
        guard let data = UserDefaults.standard.object(forKey: "\(indexPath.row)") as? Data else { return UICollectionViewCell() }
        
        cell.photo.image = UIImage(data: data)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       print("User tapped on item \(indexPath.row)")
    }
}
