//
//  CollectionMangasRepository.swift
//  My Mangas
//
//  Created by Alexandre DUARTE on 30/01/2022.
//

import Foundation
import RxSwift

protocol CollectionMangasRepository {
    func getMangasCollection() -> Observable<[CollectionMangaItem]>
}

struct RxCollectionMangasRepository: CollectionMangasRepository {
    func getMangasCollection() -> Observable<[CollectionMangaItem]> {
        return Observable.deferred {
            let mangaItem = CollectionMangaItem(id: "1", name: "Undead Unluck", imageURL: "https://static.fnac-static.com/multimedia/Images/FR/NR/16/ba/cd/13482518/1507-1/tsp20211027075615/Undead-unluck.jpg", updatedAt: 1644156357)
            
            return Observable.just([mangaItem])
        }
    }
}
