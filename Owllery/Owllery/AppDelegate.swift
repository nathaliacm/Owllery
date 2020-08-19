//
//  AppDelegate.swift
//  Owllery
//
//  Created by Nathalia Cardoso on 13/08/20.
//  Copyright © 2020 Nathalia Cardoso. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        UserDefaults.standard.set(false, forKey: "showPhotos")
        UserDefaults.standard.set(0, forKey: "photosCount")
        
        var photos: [Photo] = []
        var count = 0
        
        APIManager().getData { (result) in
            switch result {
            case .success(let apiPhotos):
                for photo in apiPhotos {
                    let photo = Photo(id: photo.id, urls: photo.urls)
                    photos.append(photo)
                    guard let url = URL(string: photo.urls["regular"] ?? "") else { return }
                    
                    let dataOpt = try? Data(contentsOf: url)
                    
                    if let data = dataOpt {
                        UserDefaults.standard.setValue(data, forKey: "\(count)")
                        count += 1
                    }
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        while true {
            if UserDefaults.standard.bool(forKey: "showPhotos") {
                UserDefaults.standard.setValue(photos.count, forKey: "photosCount")
                break
            }
        }
        return true
    }

}
