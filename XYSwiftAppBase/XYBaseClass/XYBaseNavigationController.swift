//
//  XYBaseNavigationController.swift
//  AVDemo
//
//  Created by YJ on 2023/10/26.
//

import UIKit

class XYBaseNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        xyBase_createViews()
    }
    
    private func xyBase_createViews() {
        view.backgroundColor = .white
        
        navigationBar.tintColor = .orange
        
        let standardAppearance = UINavigationBarAppearance()
        //模糊效果 最底层
        standardAppearance.backgroundEffect = UIBlurEffect(style: .systemChromeMaterial)
        
        //导航栏背景ImageView。覆盖UIVisualEffectView
        //导航栏背景ImageView背景色
        standardAppearance.backgroundColor = .yellow
        //导航栏背景ImageView图片，和导航栏背景色一起合成图片显示
        standardAppearance.backgroundImage = UIImage(named: "test")?.withRenderingMode(.alwaysTemplate)
        //导航栏背景图，填充模式
        standardAppearance.backgroundImageContentMode = .right
        
        //导航栏分隔线imageView
        //导航栏分隔线imageView图片
        standardAppearance.shadowImage = nil
        //导航栏分隔线imageView的tintColor。  如果shadowImage.renderMode == .alwaysTemplate 使用颜色渲染图片
        standardAppearance.shadowColor = .red
        
        //滑动中的样式
        navigationBar.standardAppearance = standardAppearance
        if #available(iOS 15.0, *) {
            //滑动到顶部或底部时的样式
            navigationBar.scrollEdgeAppearance = standardAppearance
        }
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if viewControllers.count == 1 {
            viewController.hidesBottomBarWhenPushed = true
        }
        super.pushViewController(viewController, animated: animated)
    }
    
//    override var shouldAutorotate: Bool {
//        return true
//    }
//    
//    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
//        return topViewController!.supportedInterfaceOrientations
//    }

}
