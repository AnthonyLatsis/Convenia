//
//  String.swift
//  Laser Nya
//
//  Created by Anthony Latsis on 18.11.16.
//  Copyright © 2016 Anthony Latsis. All rights reserved.
//

import UIKit

extension String {
 
    subscript (i: Int) -> Character {
        return self[self.index(startIndex, offsetBy: i)]
    }

    subscript (i: Int) -> String {
        return String(self[i] as Character)
    }

    subscript (r: Range<Int>) -> String {
        let start = index(startIndex, offsetBy: r.lowerBound)
        let end = index(startIndex, offsetBy: r.upperBound - r.lowerBound)
        return String(self[Range(start ..< end)])
    }
}
