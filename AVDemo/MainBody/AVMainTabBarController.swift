//
//  AVMainTabBarController.swift
//  AVDemo
//
//  Created by YJ on 2023/10/26.
//

import UIKit

class AVMainTabBarController: XYBaseTabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        main_createViews()
    }
    
    private func main_createViews() {
        let playNaviVC = AVMainNavigationController(rootViewController: AVPlayViewController())
        playNaviVC.tabBarItem = UITabBarItem(title: "播放", image: nil, selectedImage: nil)
        
        let recordNaviVC = AVMainNavigationController(rootViewController: AVRecordViewController())
        recordNaviVC.tabBarItem = UITabBarItem(title: "录制", image: nil, selectedImage: nil)
        
        let editNaviVC = AVMainNavigationController(rootViewController: AVEditViewController())
        editNaviVC.tabBarItem = UITabBarItem(title: "编辑", image: nil, selectedImage: nil)
        
        let processNaviVC = AVMainNavigationController(rootViewController: AVProcessViewController())
        processNaviVC.tabBarItem = UITabBarItem(title: "处理", image: nil, selectedImage: nil)
        
        viewControllers = [playNaviVC, recordNaviVC, editNaviVC, processNaviVC]
    }
    

}
