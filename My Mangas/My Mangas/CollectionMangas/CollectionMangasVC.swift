//
//  CollectionMangasVC.swift
//  My Mangas
//
//  Created by Alexandre DUARTE on 30/01/2022.
//

import UIKit
import os.log
import RxSwift
import RxCocoa

final class CollectionMangasVC: UILifeCycleVC, HasCustomView {

    // MARK: - Attributes
    
    typealias CustomView = CollectionMangasView
    
    // MARK: - ViewModel
    
    private lazy var viewModel: CollectionMangasViewModel = {
        return CollectionMangasViewModelImpl(
            collectionMangasRepository: CollectionMangasRepositoryImpl()
        )
    }()
    
    // MARK: - DisposeBag
    
    private let layoutFactory: CollectionLayoutFactory
    private let disposeBag: DisposeBag
    
    init(layoutFactory: CollectionLayoutFactory) {
        self.layoutFactory = layoutFactory
        self.disposeBag = DisposeBag()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("CollectionMangasVC:not available")
    }
    
    override func loadView() {
        super.loadView()
        
        let customView = CollectionMangasView(layoutFactory)
        view = customView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bindVM()
    }
}

// MARK: - Private helpers

extension CollectionMangasVC {
    private func bindVM() {
        viewModel.isLoadingSubject
            .bind(to: customView.loadingIndicator.rx.isAnimating)
            .disposed(by: disposeBag)
        
        viewModel.errorSubject
            .bind { [unowned self] error in
                self.customView.collectionView.isHidden = true
                self.customView.errorLabel.isHidden = false
                self.customView.errorLabel.text = error.errorDescription
            }.disposed(by: disposeBag)
        
        viewModel.mangasCollectionSubject
            .bind(to: customView.collectionView.rx.items(
                cellIdentifier: CollectionMangaCell.identifier,
                cellType: CollectionMangaCell.self)
        ) { index, model, cell in
            cell.bind(model)
        }.disposed(by: disposeBag)
        
        viewModel.fetchMangasCollection()
    }
}
