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
    
    private let collectionView: UICollectionView = {
        let fraction: CGFloat = 1 / 2
        
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(fraction),
            heightDimension: .fractionalHeight(1)
        )
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalWidth(fraction)
        )
        
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitems: [item]
        )
        
        let section = NSCollectionLayoutSection(group: group)
        let layout = UICollectionViewCompositionalLayout(section: section)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white
        collectionView.register(CollectionMangaCell.self, forCellWithReuseIdentifier: CollectionMangaCell.identifier)
        
        return collectionView
    }()
    
    // MARK: - ViewModel
    
    private lazy var viewModel: CollectionMangasViewModel = {
        return CollectionMangasViewModelImpl(
            collectionMangasRepository: RxCollectionMangasRepository()
        )
    }()
    
    // MARK: - DisposeBag
    
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        viewModel.mangasCollection.bind(
            to: collectionView.rx.items(cellIdentifier: CollectionMangaCell.identifier, cellType: CollectionMangaCell.self)
        ) { index, model, cell in
            print("Bind manga item", model)
            cell.bind(model)
            
        }.disposed(by: disposeBag)
    }
}
