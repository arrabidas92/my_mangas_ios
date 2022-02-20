//
//  HasCustomView.swift
//  My Mangas
//
//  Created by Alexandre DUARTE on 20/02/2022.
//

import UIKit

public protocol HasCustomView {
    associatedtype CustomView: UIView
}

extension HasCustomView where Self: UIViewController {
    public var customView: CustomView {
        guard let customView = view as? CustomView else {
            fatalError("Expected view to be of type \(CustomView.self) but got \(type(of: view)) instead")
        }
        
        return customView
    }
}
