//
//  CGPoint.swift
//  Laser Nya
//
//  Created by Anthony Latsis on 18.11.16.
//  Copyright © 2016 Anthony Latsis. All rights reserved.
//

import UIKit

extension CGPoint {
    
    init(value: CGFloat) {
        
        self.init(x: value, y: value)
    }
    
    init(x: CGFloat) {
        
        self.init(x: x, y: 0)
    }
    
    init(y: CGFloat) {
        
        self.init(x: y, y: 0)
    }
    
    static func +=(lhs: inout CGPoint, rhs: CGPoint) {
        
        lhs = lhs + rhs
    }
    
    static func -=(lhs: inout CGPoint, rhs: CGPoint) {
        
        lhs += (-rhs)
    }
    
    static func *=(lhs: inout CGPoint, rhs: CGFloat) {
        
        lhs = lhs * rhs
    }
    
    static func /=(lhs: inout CGPoint, rhs: CGFloat) {
        
        lhs = lhs / rhs
    }
    
    
    static func +(lhs: CGPoint, rhs: CGPoint) -> CGPoint {
        
        return CGPoint.init(x: lhs.x + rhs.x, y: lhs.y + rhs.y)
    }
    
    static func +(lhs: CGPoint, rhs: CGFloat) -> CGPoint {
        
        return CGPoint.init(x: lhs.x + rhs, y: lhs.y + rhs)
    }
    
    static func +(lhs: CGPoint, rhs: (CGFloat, CGFloat)) -> CGPoint {
        
        return CGPoint.init(x: lhs.x + rhs.0, y: lhs.y + rhs.1)
    }
    
    static func -(lhs: CGPoint, rhs: CGPoint) -> CGPoint {
        
        return lhs + (-rhs)
    }
    
    static func -(lhs: CGPoint, rhs: CGFloat) -> CGPoint {
        
        return lhs + (-rhs)
    }
    
    static func -(lhs: CGPoint, rhs: (CGFloat, CGFloat)) -> CGPoint {
        
        return lhs + (-rhs.0, -rhs.1)
    }
    
    static func *(lhs: CGPoint, rhs: CGFloat) -> CGPoint {
        
        return CGPoint.init(x: lhs.x * rhs, y: lhs.y * rhs)
    }
    
    static func /(lhs: CGPoint, rhs: CGFloat) -> CGPoint {
        
        return lhs * (1 / rhs)
    }
    
    static prefix func -(arg: CGPoint) -> CGPoint {
        
        return CGPoint.init(x: -arg.x, y: -arg.y)
    }
}
