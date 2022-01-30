//
//  CollectionMangasItem.swift
//  My Mangas
//
//  Created by Alexandre DUARTE on 30/01/2022.
//

import Foundation

struct CollectionMangaItem {
    
    let id: String
    let name: String
    let imageURL: String
    let updatedAt: Double
    
    init(
        id: String,
        name: String,
        imageURL: String,
        updatedAt: Double
    ) {
        self.id = id
        self.name = name
        self.imageURL = imageURL
        self.updatedAt = updatedAt
    }
}

extension CollectionMangaItem: FirebaseData {
    
    init?(data: FirebaseJSON) {
        guard let id = data[CollectionMangaItem.Field.id.rawValue] as? String,
              let name = data[CollectionMangaItem.Field.name.rawValue] as? String,
              let imageURL = data[CollectionMangaItem.Field.imageURL.rawValue] as? String,
              let updatedAt = data[CollectionMangaItem.Field.updatedAt.rawValue] as? Double else {
                  return nil
              }
        
        self.init(id: id, name: name, imageURL: imageURL, updatedAt: updatedAt)
    }
    
    func asFirebaseJSON() -> FirebaseJSON {
        return [
            CollectionMangaItem.Field.id.rawValue: id,
            CollectionMangaItem.Field.name.rawValue: name,
            CollectionMangaItem.Field.imageURL.rawValue: imageURL,
            CollectionMangaItem.Field.updatedAt.rawValue: updatedAt
        ]
    }
}

extension CollectionMangaItem {
    
    private enum Field: String {
        case id, name, imageURL, updatedAt
    }
}
