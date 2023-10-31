//
//  XYBaseTabBarController.swift
//  AVDemo
//
//  Created by YJ on 2023/10/26.
//

import UIKit

class XYBaseTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        xyBase_createViews()
    }
    
    private func xyBase_createViews() {
        view.backgroundColor = .white
        
        let standardAppearance = UITabBarAppearance()
        standardAppearance.backgroundColor = .white
        standardAppearance.shadowColor = .clear
        tabBar.standardAppearance = standardAppearance
        if #available(iOS 15.0, *) {
            tabBar.scrollEdgeAppearance = standardAppearance
        }
    }
    
//    override var shouldAutorotate: Bool {
//        return true
//    }
//    
//    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
//        return selectedViewController!.supportedInterfaceOrientations
//    }

}
