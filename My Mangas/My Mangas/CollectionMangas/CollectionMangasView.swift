//
//  CollectionMangasView.swift
//  My Mangas
//
//  Created by Alexandre DUARTE on 20/02/2022.
//

import UIKit

final class CollectionMangasView: UIView {
    
    // MARK: - UI
    
    unowned var collectionView: UICollectionView!
    unowned var loadingIndicator: UIActivityIndicatorView!
    unowned var errorLabel: UILabel!
    
    // MARK: - LayoutFactory
    
    private let layoutFactory: CollectionLayoutFactory
    
    // MARK: - Init
    
    init(_ layoutFactory: CollectionLayoutFactory) {
        self.layoutFactory = layoutFactory
        super.init(frame: .zero)
        self.setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("not available")
    }
    
    private func setupView() {
        backgroundColor = .white
        
        setupCollectionView()
        setupErrorLabel()
        setupLoadingIndicator()
    }
    
    private func setupLoadingIndicator() {
        let loadingIndicator = UIActivityIndicatorView(style: .large)
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.color = .black
        loadingIndicator.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(loadingIndicator)
        
        self.loadingIndicator = loadingIndicator
        
        NSLayoutConstraint.activate([
            loadingIndicator.centerXAnchor.constraint(equalTo: centerXAnchor),
            loadingIndicator.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    private func setupErrorLabel() {
        let errorLabel = UILabel()
        errorLabel.text = nil
        errorLabel.textColor = .black
        errorLabel.numberOfLines = 0
        errorLabel.textAlignment = .center
        errorLabel.isHidden = true
        errorLabel.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(errorLabel)
        
        self.errorLabel = errorLabel
        
        NSLayoutConstraint.activate([
            errorLabel.topAnchor.constraint(equalTo: topAnchor),
            errorLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            errorLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            errorLabel.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    private func setupCollectionView() {
        let layout = layoutFactory.create()
        let collectionLayout = layout.createLayout()
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white
        collectionView.register(CollectionMangaCell.self, forCellWithReuseIdentifier: CollectionMangaCell.identifier)
        
        addSubview(collectionView)
        
        self.collectionView = collectionView
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}
