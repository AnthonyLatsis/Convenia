//
//  CGRect.swift
//  demo
//
//  Created by Anthony Latsis on 20.11.16.
//  Copyright © 2016 Anthony Latsis. All rights reserved.
//

import CoreGraphics

extension CGRect {

    var center: CGPoint {
        return CGPoint(x: self.width / 2, y: self.height / 2)
    }

    init(size: CGSize) {
        self.init(origin: CGPoint.zero, size: size)
    }

    init(width: CGFloat, height: CGFloat) {
        self.init(x: 0, y: 0, width: width, height: height)
    }

    init(cgFloat: CGFloat) {
        self.init(size: CGSize(cgFloat: cgFloat))
    }

    init(double: Double) {
        self.init(size: CGSize(double: double))
    }

    init(float: Float) {
        self.init(size: CGSize(float: float))
    }
}
