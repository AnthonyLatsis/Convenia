//
//  CGAffineTransform.swift
//  LED
//
//  Created by Anthony Latsis on 12/22/17.
//  Copyright © 2017 Anthony Latsis. All rights reserved.
//

import CoreGraphics


extension CGAffineTransform {
    
    init(scale: CGFloat) {
        
        self.init(scaleX: scale, y: scale)
    }
    
    init(translation value: CGFloat) {
        
        self.init(translationX: value, y: value)
    }

    
    static func translation(x: CGFloat) -> CGAffineTransform {
        
        return self.init(translationX: x, y: 0)
    }
    
    static func translation(y: CGFloat) -> CGAffineTransform {
        
        return self.init(translationX: 0, y: y)
    }
    
    static func translation(x: CGFloat, y: CGFloat) -> CGAffineTransform {
        
        return self.init(translationX: x, y: y)
    }

    static func scale(x: CGFloat) -> CGAffineTransform {
        
        return self.init(scaleX: x, y: 1)
    }
    
    static func scale(y: CGFloat) -> CGAffineTransform {
        
        return self.init(scaleX: 1, y: y)
    }
    
    static func scale(x: CGFloat, y: CGFloat) -> CGAffineTransform {
        
        return self.init(scaleX: x, y: y)
    }
    
    static func rotation(angle: CGFloat) -> CGAffineTransform {
        
        return self.init(rotationAngle: angle)
    }
    
    func translated(x: CGFloat) -> CGAffineTransform {
        
        return self.scaledBy(x: x, y: 0)
    }
    
    func translated(y: CGFloat) -> CGAffineTransform {
        
        return self.scaledBy(x: 0, y: y)
    }
    
    func translated(by value: CGFloat) -> CGAffineTransform {
        
        return self.translatedBy(x: value, y: value)
    }
    
    func translated(x: CGFloat, y: CGFloat) -> CGAffineTransform {
        
        return self.scaledBy(x: x, y: y)
    }
    
    
    func scaled(x: CGFloat) -> CGAffineTransform {
        
        return self.scaledBy(x: x, y: 1)
    }
    
    func scaled(y: CGFloat) -> CGAffineTransform {
        
        return self.scaledBy(x: 1, y: y)
    }
    
    func scaled(by value: CGFloat) -> CGAffineTransform {
        
        return self.scaledBy(x: value, y: value)
    }
    
    func scaled(x: CGFloat, y: CGFloat) -> CGAffineTransform {
        
        return self.scaledBy(x: x, y: y)
    }
}

