//
//  CollectionMangasVM.swift
//  My Mangas
//
//  Created by Alexandre DUARTE on 30/01/2022.
//

import Foundation
import RxSwift

protocol CollectionMangasViewModel: AnyObject {
    var mangasCollection: Observable<[CollectionMangaItem]> { get }
}

final class CollectionMangasViewModelImpl: CollectionMangasViewModel {
    private let collectionMangasRepository: CollectionMangasRepository
    
    init(collectionMangasRepository: CollectionMangasRepository) {
        self.collectionMangasRepository = collectionMangasRepository
    }
    
    var mangasCollection: Observable<[CollectionMangaItem]> {
        return collectionMangasRepository.getMangasCollection()
    }
}
