//
//  AlbumViewControllerExtension.swift
//  Owllery
//
//  Created by Nathalia Cardoso on 21/08/20.
//  Copyright © 2020 Nathalia Cardoso. All rights reserved.
//

import UIKit

extension AlbumViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(self.currentItem.collectionImages.count)
        return self.currentItem.collectionImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath) as? PhotoCustomCell else {
            return UICollectionViewCell()
        }
        
        guard let data = self.currentItem.collectionImages[indexPath.row] else { return UICollectionViewCell() }
        
        cell.photo.image = UIImage(data: data)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       print("User tapped on item \(indexPath.row)")
        guard let currentItem = self.currentItem.collectionImages[indexPath.row] else { return }
        let viewController = ShowPhotoViewController()
        viewController.photo = UIImage(data: currentItem)
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}
