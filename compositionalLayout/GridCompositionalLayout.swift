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
                widthDimension: .fractionalWidth(0.5),
                heightDimension: .fractionalWidth(0.5)
            )
        )
        item.contentInsets = .init(top: 0, leading: 2, bottom: 0, trailing: 2)
        
        return item
    }
    
    private static func makeGroup() -> NSCollectionLayoutGroup {
        let group =  NSCollectionLayoutGroup.horizontal(
            layoutSize: .init(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalWidth(0.5)
            ),
            subitems: [makeItem()]
        )
            
        group.contentInsets = .init(top: 0, leading: 2, bottom: 4, trailing: 2)
            return group
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
