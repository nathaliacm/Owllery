//
//  NewAlbumViewController.swift
//  Owllery
//
//  Created by Nathalia Cardoso on 14/08/20.
//  Copyright © 2020 Nathalia Cardoso. All rights reserved.
//

import UIKit

class NewAlbumViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    let albumImage: UIImageView = UIImageView()
    let selectImageButton: UIButton = UIButton()
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Novo Álbum"
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Salvar", style: .plain, target: self, action: nil)
        
        self.setUpAlbumImage()
        self.setUpSelectImageButton()
        
        self.imagePicker.delegate = self
    }
    
    func setUpAlbumImage() {
        albumImage.contentMode = UIView.ContentMode.scaleAspectFill
        albumImage.frame.size.width = 100
        albumImage.frame.size.height = 100
        albumImage.layer.cornerRadius = 100/2
        albumImage.clipsToBounds = true
        albumImage.center = CGPoint(x: self.view.center.x, y: 220)
        albumImage.backgroundColor = .systemGray
        self.view.addSubview(albumImage)
    }
    
    func setUpSelectImageButton() {
        selectImageButton.frame.size.width = 100
        selectImageButton.frame.size.height = 100
        selectImageButton.layer.cornerRadius = 100/2
        selectImageButton.center = CGPoint(x: self.view.center.x, y: 220)
        self.view.addSubview(selectImageButton)
        selectImageButton.setTitle("EDITAR", for: .normal)
        selectImageButton.addTarget(self, action: #selector(self.buttonClicked(_:)), for: .touchUpInside)
    }
    
    @objc func buttonClicked(_ sender: UIButton) {
        self.imagePicker.allowsEditing = false
        self.imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            albumImage.contentMode = UIView.ContentMode.scaleAspectFill
            albumImage.image = pickedImage
        }
        
        dismiss(animated: true, completion: nil)
    }
}
