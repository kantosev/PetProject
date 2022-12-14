//
//  CollectionView + Support.swift
//  PetProject
//
//  Created by Антон Кирилюк on 20.11.2022.
//

import Foundation
import UIKit
 

extension CollectionViewController {
    func addObserverForTouchSearchButton() {
        NotificationCenter.default.addObserver(self, selector: #selector(searchButtonPressed), name: .init("searchButtonPressed"), object: nil)
    }
    func addObserverForErrorSearch() {
        NotificationCenter.default.addObserver(self, selector: #selector(errorSearch), name: .init("errorSearch"), object: nil)
    }
    func registerView() {
        collectionView.register(UINib(nibName: "PhotoCell", bundle: nil), forCellWithReuseIdentifier: "PhotoCell")
        collectionView.register(UINib(nibName: "CollectionViewHeader", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "Header")
    }
    func setActivityIndicator() {
        activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        self.collectionView.addSubview(activityIndicator)
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: self.collectionView.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: self.collectionView.centerYAnchor)
        ])
    }
}
