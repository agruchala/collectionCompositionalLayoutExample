//
//  Model.swift
//  compositionalLayout
//
//  Created by Artur Gruchała on 26/09/2022.
//

import UIKit

extension UIColor {
    static var random: UIColor {
        return UIColor(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1),
            alpha: 1.0
        )
    }
}

final class ColorRepository {
    lazy var colors: [UIColor] = {
        (0...100).map { _ in
            UIColor.random
        }
    }()
}
