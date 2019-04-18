//
//  UIColor+Extension.swift
//  FRKit
//
//  Created by free on 2019/4/18.
//  Copyright © 2019 free. All rights reserved.
//

import UIKit

public extension UIColor {
    
    /// 随机颜色
    class var random: UIColor {
        let red   = CGFloat(fr_random(in: 0 ..< 255))
        let green = CGFloat(fr_random(in: 0 ..< 255))
        let blue  = CGFloat(fr_random(in: 0 ..< 255))
        return UIColor.make(red: red, green: green, blue: blue)
    }
    
    /// RGB
    class func make(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat = 100) -> UIColor {
        return UIColor(red: red / 255.0, green: green / 255.0, blue: blue / 255.0, alpha: alpha / 100)
    }
    
    /// hex
    class func make(hex: String, alpha: CGFloat = 100) -> UIColor {
        // Convert hex string to an integer
        var hexint: UInt32 = 0
        
        // Create scanner
        let scanner = Scanner(string: hex)
        
        // Tell scanner to skip the # character
        scanner.charactersToBeSkipped = CharacterSet(charactersIn: "#")
        scanner.scanHexInt32(&hexint)
        
        // Create color object, specifying alpha
        if hex.count <= 4 {
            let divisor = CGFloat(15)
            let red     = CGFloat((hexint & 0xF00) >> 8) / divisor
            let green   = CGFloat((hexint & 0x0F0) >> 4) / divisor
            let blue    = CGFloat( hexint & 0x00F      ) / divisor
            return UIColor(red: red, green: green, blue: blue, alpha: alpha / 100)
        } else {
            let divisor = CGFloat(255)
            let red     = CGFloat((hexint & 0xFF0000) >> 16) / divisor
            let green   = CGFloat((hexint & 0xFF00  ) >> 8)  / divisor
            let blue    = CGFloat( hexint & 0xFF    )        / divisor
            return UIColor(red: red, green: green, blue: blue, alpha: alpha / 100)
        }
    }
}
