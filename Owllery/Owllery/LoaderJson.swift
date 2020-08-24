//
//  LoaderJson.swift
//  Owllery
//
//  Created by Nathalia Cardoso on 21/08/20.
//  Copyright © 2020 Nathalia Cardoso. All rights reserved.
//

import Foundation

public class LoaderJson {
    
    let directory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    
    func save(update: [AlbumModel]) {
        do {
            let jsonEncoder = JSONEncoder()
            let jsonData = try jsonEncoder.encode(update)
            let json = String(data: jsonData, encoding: String.Encoding.utf8)
            let data = Data(json!.utf8)
            
            do {
                if FileManager.default.fileExists(atPath: directory.appendingPathComponent("gallery.json").relativePath) {
                    try data.write(to: URL(fileURLWithPath: directory.appendingPathComponent("gallery.json").relativePath))
                } else {
                    FileManager.default.createFile(atPath: directory.appendingPathComponent("gallery.json").relativePath, contents: data, attributes: [:])
                }
                
            } catch {
                print(error.localizedDescription)
            }
        } catch {
            print(error)
        }

    }
    
    func load() -> [AlbumModel]? {
        do {
            if !FileManager.default.fileExists(atPath: directory.appendingPathComponent("gallery.json").relativePath) {
                save(update: [])
            }
            let data = try Data(contentsOf: directory.appendingPathComponent("gallery.json"))
            let jsonDecoder = JSONDecoder()
            let dataFromJson = try jsonDecoder.decode([AlbumModel].self, from: data)
            
            return dataFromJson
            
        } catch {
            print(error)
            return nil
        }
    }
}
