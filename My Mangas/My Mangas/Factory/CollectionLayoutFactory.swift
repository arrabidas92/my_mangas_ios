//
//  CollectionLayoutFactory.swift
//  My Mangas
//
//  Created by Alexandre DUARTE on 13/02/2022.
//

import UIKit

protocol CollectionLayoutFactory {
    func create() -> CollectionLayout
}

struct CollectionMangasLayoutFactory: CollectionLayoutFactory {
    func create() -> CollectionLayout {
        return CollectionMangasLayoutProduct()
    }
}

protocol CollectionLayout {
    func createLayout() -> UICollectionViewCompositionalLayout
}

struct CollectionMangasLayoutProduct: CollectionLayout {
    func createLayout() -> UICollectionViewCompositionalLayout {
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
        return UICollectionViewCompositionalLayout(section: section)
    }
}
