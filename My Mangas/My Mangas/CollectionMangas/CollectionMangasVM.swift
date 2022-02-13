//
//  CollectionMangasVM.swift
//  My Mangas
//
//  Created by Alexandre DUARTE on 30/01/2022.
//

import Foundation
import RxSwift

protocol CollectionMangasViewModel: AnyObject {
    var mangasCollectionSubject: PublishSubject<[CollectionMangaItem]> { get set }
    var errorSubject: PublishSubject<CollectionMangasNetworkError> { get set }
    var isLoadingSubject: PublishSubject<Bool> { get set }
    func fetchMangasCollection()
}

final class CollectionMangasViewModelImpl: CollectionMangasViewModel {
    private let collectionMangasRepository: CollectionMangasRepository
    
    init(collectionMangasRepository: CollectionMangasRepository) {
        self.collectionMangasRepository = collectionMangasRepository
        self.isLoadingSubject = PublishSubject<Bool>()
        self.mangasCollectionSubject = PublishSubject<[CollectionMangaItem]>()
        self.errorSubject = PublishSubject<CollectionMangasNetworkError>()
    }
    
    // MARK: - Public API
    
    var isLoadingSubject: PublishSubject<Bool>
    
    var mangasCollectionSubject: PublishSubject<[CollectionMangaItem]>
    
    var errorSubject: PublishSubject<CollectionMangasNetworkError>
    
    func fetchMangasCollection() {
        isLoadingSubject.onNext(true)
        
        let result = collectionMangasRepository.getMangasCollection()
        
        switch result {
        case .success(let data):
            isLoadingSubject.onNext(false)
            mangasCollectionSubject.onNext(data)
        case .failure(let error):
            isLoadingSubject.onNext(false)
            mangasCollectionSubject.onNext([])
            errorSubject.onNext(error)
        }
    }
}
