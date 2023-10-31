//
//  UIColor+XYExtension.swift
//  AVDemo
//
//  Created by YJ on 2023/10/27.
//

import UIKit

public extension UIColor {
    
    static func hexColor(_ hexNum: Int, alpha: CGFloat = 1) -> UIColor {
        let r = CGFloat(hexNum >> 16)
        let g = CGFloat(hexNum >> 8 & 0xFF)
        let b = CGFloat(hexNum & 0xFF)
        return UIColor(red: r/255, green: g/255, blue: b/255, alpha: alpha);
    }
    
    static func randomColor(_ alpha: CGFloat = 1) -> UIColor {
        let r = CGFloat(arc4random()%256)/255
        let g = CGFloat(arc4random()%256)/255
        let b = CGFloat(arc4random()%256)/255
        return UIColor(red: r, green: g, blue: b, alpha: alpha)
    }
    
    
    func dark() -> UIColor? {
        var hue : CGFloat = 0
        var saturation : CGFloat = 0
        var brightness : CGFloat = 0
        var alpha : CGFloat = 0
        if getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha) {
            return UIColor(hue: hue, saturation: saturation, brightness: brightness*0.5, alpha: alpha)
        }
        return nil
    }
    
    func light() -> UIColor? {
        var hue : CGFloat = 0
        var saturation : CGFloat = 0
        var brightness : CGFloat = 0
        var alpha : CGFloat = 0
        if getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha) {
            return UIColor(hue: hue, saturation: saturation, brightness: min(brightness*1.3 , 1), alpha: 0.5)
        }
        return nil
    }
}
