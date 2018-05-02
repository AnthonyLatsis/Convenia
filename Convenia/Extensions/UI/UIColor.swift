//
//  UIColor.swift
//  OnCross
//
//  Created by Anthony Latsis on 12/27/16.
//  Copyright © 2016 BrainDump. All rights reserved.
//

import UIKit

extension UIColor {
        
    func with(alpha: CGFloat) -> UIColor {
        
        return self.withAlphaComponent(alpha)
    }
    
    func mixed(with color: UIColor, fraction: CGFloat) -> UIColor {
        
        var frgba: (CGFloat, CGFloat, CGFloat, CGFloat) = (0.0, 0.0, 0.0, 0.0)
        var trgba: (CGFloat, CGFloat, CGFloat, CGFloat) = (0.0, 0.0, 0.0, 0.0)
        
        self.getRed(&frgba.0, green: &frgba.1, blue: &frgba.2, alpha: &frgba.3)
        color.getRed(&trgba.0, green: &trgba.1, blue: &trgba.2, alpha: &trgba.3)
        
        return UIColor(red: frgba.0 + fraction * (trgba.0 - frgba.0),
                       green: frgba.1 + fraction * (trgba.1 - frgba.1),
                       blue:  frgba.2 + fraction * (trgba.2 - frgba.2),
                       alpha: frgba.3 + fraction * (trgba.3 - frgba.3))
    }
}
