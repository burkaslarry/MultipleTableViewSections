//
//  CollectionViewCell.swift
//  tablecell
//
//  Created by Larry on 8/2/2021.
//

import Foundation

import UIKit

final class CollectionViewCell: UICollectionViewCell {
    
    static let reuseIdentifier = "CollectionViewCell"
    
    private lazy var squareView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemBlue
        view.heightAnchor.constraint(equalToConstant: 80).isActive = true
        view.widthAnchor.constraint(equalToConstant: 80).isActive = true
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        self.contentView.addSubview(self.squareView)
        // Needed to avoid the `UIView-Encapsulated-Layout-Height` issue
        let bottomConstraint = self.squareView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor)
        bottomConstraint.priority = .required - 1
        
        // Needed to avoid the `UIView-Encapsulated-Layout-Width` issue
        let trailingConstraint = self.squareView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor)
        trailingConstraint.priority = .required - 1
        NSLayoutConstraint.activate([
            self.squareView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            self.squareView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            trailingConstraint,
            bottomConstraint
        ])
    }
}
