//
//  NewAlbumViewController.swift
//  Owllery
//
//  Created by Nathalia Cardoso on 14/08/20.
//  Copyright © 2020 Nathalia Cardoso. All rights reserved.
//

import UIKit
import Photos
import BSImagePicker

class NewAlbumViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    let albumImage: UIImageView = UIImageView()
    let selectImageButton: UIButton = UIButton()
    let nameTextField: UITextField = UITextField()
    let imagePicker = UIImagePickerController()
    let selectAlbumImagesButton: UIButton = UIButton()
    var photoArray: [UIImage] = [UIImage]()
    var selectedAssets = [PHAsset]()
    var album: AlbumModel = AlbumModel(name: "", albumImage: nil, collectionImages: [])
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Novo Álbum"
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Salvar", style: .plain, target: self, action: #selector(saveContent(_:)))
        
        self.setUpAlbumImage()
        self.setUpSelectImageButton()
        //self.setUpNameLabel()
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
        albumImage.backgroundColor = .secondarySystemFill
    }
    
    func setUpSelectImageButton() {
        self.view.addSubview(selectImageButton)
        
        self.setUpSelectImageButtonConstraints()
        
        selectImageButton.setTitleColor(.systemBlue, for: .normal)
        selectImageButton.layer.cornerRadius = 100/2
        selectImageButton.setTitle("+", for: .normal)
        selectImageButton.addTarget(self, action: #selector(self.selectImageButtonClicked(_:)), for: .touchUpInside)
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
        selectAlbumImagesButton.addTarget(self, action: #selector(self.selectAlbumImagesButtonClicked(_:)), for: .touchUpInside)
    }
    
    func setUpSelectAlbumImagesButtonConstraints() {
        selectAlbumImagesButton.translatesAutoresizingMaskIntoConstraints = false
        
        selectAlbumImagesButton.topAnchor.constraint(equalTo: nameTextField.topAnchor, constant: 100).isActive = true
        selectAlbumImagesButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        selectAlbumImagesButton.widthAnchor.constraint(equalToConstant: 150).isActive = true
        selectAlbumImagesButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    func setUpNameTextFieldContraints() {
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        
        nameTextField.topAnchor.constraint(equalTo: albumImage.topAnchor, constant: 170).isActive = true
        nameTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 45).isActive = true
        nameTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -45).isActive = true
        nameTextField.heightAnchor.constraint(equalToConstant: 30).isActive = true
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
    
    @objc func saveContent(_ sender: UIButton) {
        album.name = nameTextField.text ?? ""
        var albuns = LoaderJson().load()
        
        albuns?.append(album)
        if let albuns = albuns {
            LoaderJson().save(update: albuns)
            print("salvou")
        }
        
        self.navigationController?.popViewController(animated: true)
        
    }
    
    @objc func selectImageButtonClicked(_ sender: UIButton) {
        self.imagePicker.allowsEditing = false
        self.imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    
    @objc func selectAlbumImagesButtonClicked(_ sender: UIButton) {
        let imagesPicker = ImagePickerController()
        
        self.presentImagePicker(imagesPicker, animated: true, select: { (_ : PHAsset) -> Void in
            
        }, deselect: { (assets: PHAsset) -> Void in
            
        }, cancel: { (assets: [PHAsset]) -> Void in
            
        }, finish: { (assets: [PHAsset]) -> Void in
            for i in 0..<assets.count {
                self.selectedAssets.append(assets[i])
            }
            
            self.convertAssetToImages()
            
        }, completion: nil)
    }
    
    func convertAssetToImages() {
            
            if selectedAssets.count != 0 {
                
                for i in 0..<selectedAssets.count {
                    
                    let manager = PHImageManager.default()
                    let option = PHImageRequestOptions()
                    var thumbnail = UIImage()
                    option.isSynchronous = true
                    
                    manager.requestImage(for: selectedAssets[i], targetSize: CGSize(width: 200, height: 200), contentMode: .aspectFill, options: option, resultHandler: {(result, _) -> Void in
                        thumbnail = result!
                        
                    })
                    
                    let data = thumbnail.jpegData(compressionQuality: 1)
                    album.collectionImages.append(data)
                    let newImage = UIImage(data: data!)
                  
                    self.photoArray.append(newImage! as UIImage)
                    
                }
               
            }
        
            print("complete photo array \(self.photoArray)")
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            albumImage.contentMode = UIView.ContentMode.scaleAspectFill
            //albumImage.image = pickedImage
            //NSData().
            if let data = pickedImage.pngData() {
                album.albumImage = data
                albumImage.image = UIImage(data: data)
            }
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}
