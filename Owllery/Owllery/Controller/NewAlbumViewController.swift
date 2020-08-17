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
    let nameLabel: UILabel = UILabel()
    let nameTextField: UITextField = UITextField()
    let imagePicker = UIImagePickerController()
    let selectAlbumImagesButton: UIButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Novo Álbum"
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Salvar", style: .plain, target: self, action: nil)
        
        self.setUpAlbumImage()
        self.setUpSelectImageButton()
        self.setUpNameLabel()
        self.setUpNameTextField()
        self.setUpSelectAlbumImagesButton()
        
        self.imagePicker.delegate = self
    }
    
    func setUpAlbumImage() {
        self.view.addSubview(albumImage)
        
        self.setUpAlbumImageConstraints()
        
        albumImage.contentMode = UIView.ContentMode.scaleAspectFill
        albumImage.layer.cornerRadius = 100/2
        albumImage.clipsToBounds = true
        albumImage.backgroundColor = .systemGray
    }
    
    func setUpSelectImageButton() {
        self.view.addSubview(selectImageButton)
        
        self.setUpSelectImageButtonConstraints()
        
        selectImageButton.layer.cornerRadius = 100/2
        selectImageButton.setTitle("EDITAR", for: .normal)
        selectImageButton.addTarget(self, action: #selector(self.buttonClicked(_:)), for: .touchUpInside)
    }
    
    func setUpNameLabel() {
        self.view.addSubview(nameLabel)
        
        self.setUpNameLabelConstraints()
        
        nameLabel.text = "Nome do álbum: "
    }
    
    func setUpNameTextField() {
        self.view.addSubview(nameTextField)
        
        self.setUpNameTextFieldContraints()
        nameTextField.placeholder = "nome do álbum "
        nameTextField.backgroundColor = .tertiarySystemFill
        nameTextField.borderStyle = .roundedRect
    }
    
    func setUpSelectAlbumImagesButton() {
        self.view.addSubview(selectAlbumImagesButton)
        
        self.setUpSelectAlbumImagesButtonConstraints()
        
        selectAlbumImagesButton.setTitle("Selecionar fotos", for: .normal)
        selectAlbumImagesButton.setTitleColor(.systemBlue, for: .normal)
    }
    
    func setUpSelectAlbumImagesButtonConstraints() {
        selectAlbumImagesButton.translatesAutoresizingMaskIntoConstraints = false
        
        selectAlbumImagesButton.topAnchor.constraint(equalTo: nameLabel.topAnchor, constant: 100).isActive = true
        selectAlbumImagesButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        selectAlbumImagesButton.widthAnchor.constraint(equalToConstant: 150).isActive = true
        selectAlbumImagesButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    func setUpNameTextFieldContraints() {
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        
        nameTextField.topAnchor.constraint(equalTo: albumImage.topAnchor, constant: 170).isActive = true
        nameTextField.leftAnchor.constraint(equalTo: nameLabel.leftAnchor, constant: 140).isActive = true
        nameTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        nameTextField.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    func setUpNameLabelConstraints() {
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        nameLabel.topAnchor.constraint(equalTo: albumImage.topAnchor, constant: 170).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        nameLabel.widthAnchor.constraint(equalToConstant: 150).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    func setUpAlbumImageConstraints() {
        albumImage.translatesAutoresizingMaskIntoConstraints = false
        
        albumImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        albumImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 200).isActive = true
        albumImage.widthAnchor.constraint(equalToConstant: 100).isActive = true
        albumImage.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    func setUpSelectImageButtonConstraints() {
        selectImageButton.translatesAutoresizingMaskIntoConstraints = false
        
        selectImageButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        selectImageButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 200).isActive = true
        selectImageButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        selectImageButton.heightAnchor.constraint(equalToConstant: 100).isActive = true
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
