//
//  CollectionMangaCell.swift
//  My Mangas
//
//  Created by Alexandre DUARTE on 06/02/2022.
//

import UIKit
import Kingfisher

final class CollectionMangaCell: UICollectionViewCell {
    
    // MARK: - UI
    
    private let label: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView(image: nil)
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
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
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        label.text = nil
        imageView.image = nil
    }
    
    // MARK: - Bind
    
    func bind(_ item: CollectionMangaItem) {
        label.text = item.name
        let url = URL(string: item.imageURL)
        imageView.kf.setImage(with: url)
    }
}

// MARK: - Private helpers

extension CollectionMangaCell {
    private func setup() {
        contentView.addSubview(imageView)
        //contentView.addSubview(label)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
}
