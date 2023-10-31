//
//  AVAudioRotaryKnobControl.swift
//  AVDemo
//
//  Created by YJ on 2023/10/28.
//

import UIKit

class AVAudioRotaryKnobControl: UIControl {
    
    var minimumValue : Float = 0
    var maximumValue : Float = 1
    var value : Float = 0.5
    
    private let maxAngle : Float = 120
    private var angle : Float = 0
    private var touchPoint = CGPointZero
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {

        let colorSpace = CGColorSpace(name: CGColorSpace.sRGB)
        let context = UIGraphicsGetCurrentContext()
        
        //gradient 
        var gradientLightColor = UIColor(red: 0.101, green: 0.1, blue: 0.103, alpha: 1)
        var gradientDarkColor = UIColor(red: 0.237, green: 0.242, blue: 0.242, alpha: 1)
        if isHighlighted, let lightDark = gradientLightColor.dark(), let darkDark = gradientDarkColor.dark() {
            gradientLightColor = lightDark
            gradientDarkColor = darkDark
        }
        let gradientColors = [gradientLightColor.cgColor, gradientDarkColor.cgColor]
        let locations : [CGFloat] = [0, 1]
        let gradient = CGGradient(colorsSpace: colorSpace, colors: gradientColors as CFArray, locations: locations)
        
        
        let insetRect = CGRectInset(rect, 2, 2)
        
        //
        let strokeColor = UIColor(white: 0.06, alpha: 1)
        context?.setFillColor(strokeColor.cgColor)
        context?.fillEllipse(in: insetRect)

        let midX = insetRect.midX
        let midY = insetRect.midY

        //Draw Bezel Light Shadow Layer
        context?.addArc(center: CGPointMake(midX, midY), radius: insetRect.width/2, startAngle: 0, endAngle: .pi*2, clockwise: true)
        context?.setShadow(offset: CGSizeMake(0, 0.5), blur: 2, color: UIColor.darkGray.cgColor)
        context?.fillPath()

        //Add Clipping Region for Knob Background
        context?.addArc(center: CGPointMake(midX, midY), radius: insetRect.width/2 - 3, startAngle: 0, endAngle: .pi*2, clockwise: true)
        context?.clip()

        //
        context?.drawLinearGradient(gradient!, start: CGPointMake(midX, insetRect.maxY), end: CGPointMake(midX, insetRect.minY), options: .drawsBeforeStartLocation)
        
        
        //圆点
        let dotWidth = rect.width*0.15
        let dotHeight = rect.height*0.15
        let dotRect = CGRectMake(midX - dotWidth/2, rect.minY + 15, dotWidth, dotHeight)
        
        let dotStrokeColor = UIColor.white.dark() ?? UIColor.white
        context?.setStrokeColor(dotStrokeColor.cgColor)
        context?.setFillColor(UIColor.white.cgColor)
    
        let shadowColor = UIColor.white.light() ?? UIColor.white
        let shadowOffset = CGSizeMake(0, 0)
        let blurRadius : CGFloat = 5

        context?.setShadow(offset: shadowOffset, blur: blurRadius, color: shadowColor.cgColor)
        context?.addEllipse(in: dotRect)
        context?.drawPath(using: .fillStroke)
    }
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        touchPoint = touch.location(in: self)
        isHighlighted = true
        setNeedsDisplay()
        return true
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        
        return true
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        sendActions(for: .valueChanged)
        isHighlighted = false
        setNeedsDisplay()
    }
    
    override func cancelTracking(with event: UIEvent?) {
        isHighlighted = false
        setNeedsDisplay()
    }
    
    //MARK: - Method
    
//    private func valueForAngle(angle: Float) -> Float {
//        
//    }
//    
//    private func angleForValue(value: Float) -> Float {
//        
//    }
    
}
