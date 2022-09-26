//
//  GridCompositionalLayout.swift
//  compositionalLayout
//
//  Created by Artur Gruchała on 26/09/2022.
//

import UIKit

enum GridCompositionalLayout {
    static func generateLayout() -> UICollectionViewCompositionalLayout {
        
        let config = UICollectionViewCompositionalLayoutConfiguration()
        
        return UICollectionViewCompositionalLayout(
            section: makeSection(),
            configuration: config
        )
    }
    
    private static func makeItem() -> NSCollectionLayoutItem {
        let item = NSCollectionLayoutItem(
            layoutSize: .init(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalWidth(1)
            )
        )
        item.contentInsets = .init(top: 0, leading: 4, bottom: 4, trailing: 4)
        
        return item
    }
    
    private static func makeGroup() -> NSCollectionLayoutGroup {
        return NSCollectionLayoutGroup.horizontal(
            layoutSize: .init(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalWidth(1)
            ),
            subitems: [makeItem()]
        )
    }
    
    private static func makeSection() -> NSCollectionLayoutSection {
        let section = NSCollectionLayoutSection(group: makeGroup())
        section.contentInsets = .init(
            top: 16,
            leading: 0,
            bottom: 0, trailing: 0
        )
        return section
    }
    
}
