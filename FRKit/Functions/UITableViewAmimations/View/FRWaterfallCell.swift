//
//  FRWaterfallCell.swift
//  FRKit
//
//  Created by free on 2019/4/30.
//  Copyright © 2019 free. All rights reserved.
//

import UIKit

class FRWaterfallCell: UICollectionViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        contentView.layer.cornerRadius = 5
        contentView.layer.borderColor = UIColor.random.cgColor
        contentView.layer.borderWidth = 1
        
    }

}
