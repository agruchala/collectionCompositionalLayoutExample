//
//  ViewController.swift
//  compositionalLayout
//
//  Created by Artur Gruchała on 26/09/2022.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var collectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: GridCompositionalLayout.generateLayout()
    )
    
    private lazy var model = ColorRepository()

    override func viewDidLoad() {
        super.viewDidLoad()
        prepareCollectionView()
    }
    
    private func prepareCollectionView() {
        collectionView.dataSource = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        
        collectionView.register(
            HeaderView.self,
            forSupplementaryViewOfKind: SupplementaryElements.collectionHeader,
            withReuseIdentifier: SupplementaryElements.collectionHeader
        )
        
        collectionView.register(
            HeaderView.self,
            forSupplementaryViewOfKind: SupplementaryElements.sectionHeader,
            withReuseIdentifier: SupplementaryElements.sectionHeader
        )

        collectionView.register(
            Spacer.self,
            forSupplementaryViewOfKind: SupplementaryElements.sectionSpacer,
            withReuseIdentifier: SupplementaryElements.sectionSpacer
        )

        
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate(
            [
                collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
            ]
        )
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model.colors.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = model.colors[indexPath.row]
        cell.layer.cornerRadius = 5
        cell.layer.masksToBounds = true
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let cell = collectionView.dequeueReusableSupplementaryView(
            ofKind: kind,
            withReuseIdentifier: kind,
            for: indexPath
        )
        
        if let header = cell as? HeaderView {
            header.label.text = kind
        }
        
        return cell
    }
}

