//
//  CardCollectionViewCell.swift
//  EasyHongHeiYe
//
//  Created by 张和悦 on 2018/11/29.
//  Copyright © 2018 张和悦. All rights reserved.
//

import UIKit

class CardCollectionViewCell: UICollectionViewCell {

    @IBOutlet private weak var label: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func set(number: Int) {
        label.text = "\(number)"
    }

}
