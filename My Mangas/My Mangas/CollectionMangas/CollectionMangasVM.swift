//
//  CollectionMangasVM.swift
//  My Mangas
//
//  Created by Alexandre DUARTE on 30/01/2022.
//

import Foundation
import RxSwift

protocol CollectionMangasViewModel: AnyObject {
    func getMangasCollection() -> Single<[CollectionMangaItem]>
}

final class CollectionMangasViewModelImpl: CollectionMangasViewModel {
    
    func getMangasCollection() -> Single<[CollectionMangaItem]> {
        return Single.deferred {
            // MARK: - TO IMPLEMENT
            return Single.just([])
        }
    }
}
