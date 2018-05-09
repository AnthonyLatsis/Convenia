//
//  CGSize.swift
//  demo
//
//  Created by Anthony Latsis on 20.11.16.
//  Copyright © 2016 Anthony Latsis. All rights reserved.
//

import CoreGraphics

extension CGSize {

    init(cgFloat: CGFloat) {

        self.init(width: cgFloat, height: cgFloat)
    }

    init(double: Double) {

        self.init(cgFloat: CGFloat(double))
    }

    init(float: Float) {

        self.init(cgFloat: CGFloat(float))
    }


    static func *=(lhs: inout CGSize, rhs: CGFloat) {

        lhs = lhs * rhs
    }

    static func /=(lhs: inout CGSize, rhs: CGFloat) {

        lhs = lhs / rhs
    }

    static func +(lhs: CGSize, rhs: CGFloat) -> CGSize {

        return CGSize.init(width: lhs.width + rhs, height: lhs.height + rhs)
    }

    static func -(lhs: CGSize, rhs: CGFloat) -> CGSize {

        return lhs + (-rhs)
    }

    static func *(lhs: CGSize, rhs: CGFloat) -> CGSize {

        return CGSize.init(width: lhs.width * rhs, height: lhs.height * rhs)
    }

    static func *(lhs: CGFloat, rhs: CGSize) -> CGSize {

        return rhs * lhs
    }

    static func /(lhs: CGSize, rhs: CGFloat) -> CGSize {

        return lhs * (1 / rhs)
    }
}
