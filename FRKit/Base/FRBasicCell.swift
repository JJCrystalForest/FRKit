//
//  FRBasicCell.swift
//  FRKit
//
//  Created by free on 2019/4/16.
//  Copyright © 2019 free. All rights reserved.
//

import UIKit

/// Basic cell 的样式
///
/// - normal: 默认样式
/// - indent: 缩进样式
enum FRBasicTableViewCellType {
    /// 默认样式，不做任何改变
    case normal
    /// 缩进样式，frame: x+=16,width-=32,y+=8,height-=16
    case indent
}

class FRBasicCell: UITableViewCell {
    
    /// cell 的样式
    var frameType : FRBasicTableViewCellType = .normal
    /// cell 主颜色
    var mainColor : UIColor = .white
    
    override func awakeFromNib() {
        super.awakeFromNib()

        switch frameType {

        case .normal: break  // 默认样式

        case .indent:  // 缩进样式
            contentView.layer.borderWidth = 1
            contentView.layer.borderColor = mainColor.cgColor
            contentView.layer.cornerRadius = 5
        }
    
    }
    
    override var frame: CGRect {
        didSet {
            
            switch frameType {
                
            case .normal: break  // 默认样式
                
            case .indent:  // 缩进样式
                var newFrame = frame
                newFrame.origin.x += 16
                newFrame.size.width -= 32
                newFrame.origin.y += 8
                newFrame.size.height -= 16
                super.frame = newFrame
            }
        }
    }
    
}
