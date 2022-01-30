//
//  UILifeCycleVC.swift
//  My Mangas
//
//  Created by Alexandre DUARTE on 30/01/2022.
//

import UIKit

class UILifeCycleVC: UIViewController {
    
    private lazy var className = NSStringFromClass(self.classForCoder)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("\(className):viewDidLoad")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("\(className):viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("\(className):viewDidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("\(className):viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("\(className):viewDidDisappear")
    }
    
    deinit {
        print("\(className):deinit")
    }
}
