//
//  FRHomeCell.swift
//  FRKit
//
//  Created by free on 2019/4/18.
//  Copyright © 2019 free. All rights reserved.
//

import UIKit

class FRHomeCell: FRBasicCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        frameType = .indent
        mainColor = UIColor.random
        super.awakeFromNib()
    
        titleLabel.textColor = mainColor
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
