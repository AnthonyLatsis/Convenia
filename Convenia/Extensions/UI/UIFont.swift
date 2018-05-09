//
//  UIFont.swift
//  Laser Nya
//
//  Created by Anthony Latsis on 18.11.16.
//  Copyright © 2016 Anthony Latsis. All rights reserved.
//

import UIKit

extension UIFont {

    class func system(size: CGFloat, weight: Weight = Weight.regular) -> UIFont {

        return self.systemFont(ofSize: size)
    }
}
