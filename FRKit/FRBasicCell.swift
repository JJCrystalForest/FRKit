//
//  FRBasicCell.swift
//  FRKit
//
//  Created by free on 2019/4/16.
//  Copyright © 2019 free. All rights reserved.
//

import UIKit

class FRBasicCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = UIColor.groupTableViewBackground.cgColor
        contentView.layer.cornerRadius = 5
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override var frame: CGRect {
        didSet {
            var newFrame = frame
            newFrame.origin.x += 8
            newFrame.size.width -= 16
            newFrame.origin.y += 4
            newFrame.size.height -= 8
            super.frame = newFrame
        }
    }
    
}
