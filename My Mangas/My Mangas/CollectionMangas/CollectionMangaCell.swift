//
//  CollectionMangaCell.swift
//  My Mangas
//
//  Created by Alexandre DUARTE on 06/02/2022.
//

import UIKit

final class CollectionMangaCell: UICollectionViewCell {
    
    // MARK: - UI
    
    private let label: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Init
    
    static let identifier = "CollectionMangaCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    // MARK: - Bind
    
    func bind(_ item: CollectionMangaItem) {
        label.text = item.name
    }
}

// MARK: - Private helpers

extension CollectionMangaCell {
    private func setup() {
        contentView.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
}
