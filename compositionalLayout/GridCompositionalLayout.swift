//
//  GridCompositionalLayout.swift
//  compositionalLayout
//
//  Created by Artur Gruchała on 26/09/2022.
//

import UIKit

enum SupplementaryElements {
    static let collectionHeader = "collection-header"
    static let sectionHeader = "section-header"
    static let sectionSpacer = "sectionSpacer"
}

enum GridCompositionalLayout {
    static func generateLayout() -> UICollectionViewCompositionalLayout {
        
        let config = UICollectionViewCompositionalLayoutConfiguration()
        config.boundarySupplementaryItems = [makeCollectionHeader()]
        
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
        item.contentInsets = .init(top: 0, leading: 2, bottom: 2, trailing: 2)
        
        return item
    }
    
    private static func makeBigItem() -> NSCollectionLayoutItem {
        let item = NSCollectionLayoutItem(
            layoutSize: .init(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalWidth(1)
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
        
        let groupWithBigElement = NSCollectionLayoutGroup.horizontal(
            layoutSize: .init(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalWidth(1)
            ),
            subitems: [makeBigItem()]
        )
        
        groupWithBigElement.contentInsets = .init(top: 0, leading: 2, bottom: 4, trailing: 2)
        
        
        let compositionalGroup = NSCollectionLayoutGroup.vertical(
            layoutSize: .init(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalWidth(1.5)
            ),
            subitems: [group, groupWithBigElement]
        )
        
        return compositionalGroup
    }
    
    private static func makeSectionHeader() -> NSCollectionLayoutBoundarySupplementaryItem {
        return NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: .init(
                widthDimension: .fractionalWidth(1),
                heightDimension: .absolute(32)
            ),
            elementKind: SupplementaryElements.sectionHeader,
            alignment: .top
        )
    }
    
    private static func makeCollectionHeader() -> NSCollectionLayoutBoundarySupplementaryItem {
        return NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: .init(
                widthDimension: .fractionalWidth(1),
                heightDimension: .absolute(32)
            ),
            elementKind: SupplementaryElements.collectionHeader,
            alignment: .top
        )
    }
    
    private static func makeSpacer() -> NSCollectionLayoutBoundarySupplementaryItem {
        return NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: .init(
                widthDimension: .fractionalWidth(1),
                heightDimension: .absolute(60)
            ),
            elementKind: SupplementaryElements.sectionSpacer,
            alignment: .top
        )
    }
    
    private static func makeSection() -> NSCollectionLayoutSection {
        let section = NSCollectionLayoutSection(group: makeGroup())
        section.contentInsets = .init(
            top: 16,
            leading: 0,
            bottom: 0, trailing: 0
        )
        section.boundarySupplementaryItems = [makeSpacer(), makeSectionHeader()]
        
        return section
    }
    
}
