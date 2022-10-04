//
//  SuplementaryViews.swift
//  compositionalLayout
//
//  Created by Artur Gruchała on 26/09/2022.
//

import UIKit

final class HeaderView: UICollectionReusableView {
    private(set) lazy var label = UILabel()
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        label.translatesAutoresizingMaskIntoConstraints = false
        addSubview(label)
        
        NSLayoutConstraint.activate(
            [
                label.centerXAnchor.constraint(equalTo: self.centerXAnchor),
                label.centerYAnchor.constraint(equalTo: self.centerYAnchor)
            ]
        )
    }
}


final class Spacer: UICollectionReusableView {
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
    }
}

final class LetterCell: UICollectionViewCell {
    private(set) lazy var letterLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setupViews() {
        contentView.addSubview(letterLabel)
        
        NSLayoutConstraint.activate(
            [
                contentView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
                contentView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
            ]
        )
    }
}
