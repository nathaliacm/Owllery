//
//  getData.swift
//  Owllery
//
//  Created by Nathalia Cardoso on 18/08/20.
//  Copyright © 2020 Nathalia Cardoso. All rights reserved.
//

import Foundation

struct APIManager: Codable {
    func getData(completion: @escaping (Result< [Photo], ApiError>) -> Void) {
        
        let key = "qbziGH4WZr5e7IMwKNS1GoEHZwlGUV8-kn_XR-SYzXA"
        let url = "https://api.unsplash.com/photos/random/?count=30&client_id=\(key)"
        
        guard let getUrl = URL(string: url) else {
            completion(.failure(ApiError.invalidUrl))
            return
        }
        
        let session = URLSession(configuration: .default)
        
        let getPhotosTask = session.dataTask(with: getUrl) { (data, response, error) in
            
            if error != nil {
                completion(.failure(ApiError.couldNotDecode))
            }
            
            guard let response = response as? HTTPURLResponse else {return}
            switch response.statusCode {
            case 200:
                if let data = data {
                    if let photoList = try? JSONDecoder().decode([Photo].self, from: data) {
                        completion(.success(photoList))
                        UserDefaults.standard.set(true, forKey: "showPhotos")
                    } else {
                        completion(.failure(ApiError.couldNotDecode))
                    }
                }
            default:
                completion(.failure(ApiError.failedRequest))
            }
      }
            getPhotosTask.resume()
    }
}
