//
//  UIViewController + Storyboard.swift
//  MusicBox
//
//  Created by Artem Tkachev on 23.04.24.
//

import Foundation
import UIKit

extension UIViewController {
    
    class func loadFromStoryboard<T: UIViewController>() -> T {
        let name = String(describing: T.self)
        let storyboard = UIStoryboard(name: name, bundle: nil)
        if let viewController = storyboard.instantiateInitialViewController() as? T {
            return viewController
        } else {
            fatalError("Error: Not initial viewComtroller in \(name) storyboard!")
        }
    }
}
