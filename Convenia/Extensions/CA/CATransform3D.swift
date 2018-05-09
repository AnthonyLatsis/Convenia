//
//  CATransform3D.swift
//  Convenia
//
//  Created by Anthony Latsis on 2/26/18.
//  Copyright © 2018 Anthony Latsis. All rights reserved.
//

import Foundation


extension CATransform3D: Equatable {

    public var identity: CATransform3D { return CATransform3DIdentity }

    public var isIdentity: Bool { return CATransform3DIsIdentity(self) }

    public var inverted: CATransform3D { return CATransform3DInvert(self) }

    public var affine: CGAffineTransform { return CATransform3DGetAffineTransform(self) }

    public var isAffine: Bool { return CATransform3DIsAffine(self) }


    static public func ==(lhs: CATransform3D, rhs: CATransform3D) -> Bool {

        return CATransform3DEqualToTransform(lhs, rhs)
    }

    public static func from(affine: CGAffineTransform) -> CATransform3D {

        return CATransform3DMakeAffineTransform(affine)
    }

    public static func translation(_ tx: CGFloat, _ ty: CGFloat, _ tz: CGFloat) -> CATransform3D {

        return CATransform3DMakeTranslation(tx, ty, tz)
    }

    public static func scale(_ sx: CGFloat, _ sy: CGFloat, _ sz: CGFloat) -> CATransform3D {

        return CATransform3DMakeScale(sx, sy, sz)
    }

    public static func rotation(_ angle: CGFloat, _ x: CGFloat, _ y: CGFloat, _ z: CGFloat) -> CATransform3D {

        return CATransform3DMakeRotation(angle, x, y, z)
    }

    public func translated(_ tx: CGFloat, _ ty: CGFloat, _ tz: CGFloat) -> CATransform3D {

        return CATransform3DTranslate(self, tx, ty, tz)
    }

    public func scaled(_ sx: CGFloat, _ sy: CGFloat, _ sz: CGFloat) -> CATransform3D {

        return CATransform3DScale(self, sx, sy, sz)
    }

    public func rotated(_ angle: CGFloat, _ x: CGFloat, _ y: CGFloat, _ z: CGFloat) -> CATransform3D {

        return CATransform3DRotate(self, angle, x, y, z)
    }

    public func concatenated(with: CATransform3D) -> CATransform3D {

        return CATransform3DConcat(self, with)
    }
}
