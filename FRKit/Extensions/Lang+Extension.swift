//
//  Lang+Extension.swift
//  FRKit
//
//  Created by free on 2019/4/18.
//  Copyright © 2019 free. All rights reserved.
//

import Foundation

/// Generate random number in range
public func fr_random(in range: Range<Int>) -> Int {
    let count = UInt32(range.upperBound - range.lowerBound)
    return  Int(arc4random_uniform(count)) + range.lowerBound
}
