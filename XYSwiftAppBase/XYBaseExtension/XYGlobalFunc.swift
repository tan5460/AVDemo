//
//  XYGlobalFunc.swift
//  AVDemo
//
//  Created by YJ on 2023/10/27.
//

import Foundation
import UIKit

public var XYKeyWindow : UIWindow? {
    let application = UIApplication.shared
    //多开scene情况下，不方便判断使用哪个具体的scene。而这个属性依然好用。
    var keyWindow = application.keyWindow
    //如果上面没获取到，则取第一个活动的scene
    if keyWindow == nil {
        let windowScenes = application.connectedScenes.filter {$0.activationState == .foregroundActive}.map {$0 as? UIWindowScene}
        let windowScene = windowScenes.first
        if #available(iOS 15.0, *) {
            keyWindow = windowScene??.keyWindow
        } else {
            keyWindow = windowScene??.windows.first
        }
    }
    return keyWindow
}

public var XYCurrentVC : UIViewController? {
    let tabBarVC = XYKeyWindow?.rootViewController as? UITabBarController
    let naviVC = tabBarVC?.selectedViewController as? UINavigationController
    return naviVC?.topViewController
}

public func xy_forceRotate(orientation: UIInterfaceOrientation) {
    
    if #available(iOS 16.0, *) {
        //
        var interfaceOrientationMask : UIInterfaceOrientationMask?
        switch orientation {
        case .landscapeLeft:
            interfaceOrientationMask = .landscapeLeft
        case .landscapeRight:
            interfaceOrientationMask = .landscapeRight
        default:
            interfaceOrientationMask = .portrait
        }
        //
       
        let geometryPreferencesIOS = UIWindowScene.GeometryPreferences.iOS(interfaceOrientations: interfaceOrientationMask!)
        XYKeyWindow?.windowScene?.requestGeometryUpdate(geometryPreferencesIOS, errorHandler: { error in
            
        })
        XYCurrentVC?.setNeedsUpdateOfSupportedInterfaceOrientations()
        
    } else {
        UIDevice.current.setValue(orientation.rawValue, forKey: "orientation")
    }
}
