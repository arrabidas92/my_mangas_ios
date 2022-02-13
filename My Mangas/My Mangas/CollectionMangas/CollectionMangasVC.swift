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

final class CollectionMangasVC: UILifeCycleVC {

    // MARK: - Attributes
    
    private unowned var collectionView: UICollectionView!
    private unowned var loadingIndicator: UIActivityIndicatorView!
    private unowned var errorLabel: UILabel! // TO INIT
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        bindVM()
        viewModel.fetchMangasCollection()
    }
}

// MARK: - Private helpers

extension CollectionMangasVC {
    private func bindVM() {
        viewModel.isLoadingSubject
            .bind(to: loadingIndicator.rx.isAnimating)
            .disposed(by: disposeBag)
        
        viewModel.errorSubject
            .bind { error in
                switch error {
                case .failed:
                    // TO BIND UILABEL centered
                    print("failed")
                }
            }.disposed(by: disposeBag)
        
        viewModel.mangasCollectionSubject
            .bind(to: collectionView.rx.items(
                cellIdentifier: CollectionMangaCell.identifier,
                cellType: CollectionMangaCell.self)
        ) { index, model, cell in
            cell.bind(model)
        }.disposed(by: disposeBag)
    }
    
    private func setupView() {
        view.backgroundColor = .white
        
        setupCollectionView()
        setupLoadingIndicator()
    }
    
    private func setupLoadingIndicator() {
        let loadingIndicator = UIActivityIndicatorView(style: .large)
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.color = .black
        loadingIndicator.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(loadingIndicator)
        
        self.loadingIndicator = loadingIndicator
        
        NSLayoutConstraint.activate([
            loadingIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loadingIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    private func setupCollectionView() {
        let layout = layoutFactory.create()
        let collectionLayout = layout.createLayout()
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white
        collectionView.register(CollectionMangaCell.self, forCellWithReuseIdentifier: CollectionMangaCell.identifier)
        
        view.addSubview(collectionView)
        
        self.collectionView = collectionView
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}
