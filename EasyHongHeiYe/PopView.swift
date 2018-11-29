//
//  PopView.swift
//  EasyHongHeiYe
//
//  Created by 张和悦 on 2018/11/29.
//  Copyright © 2018 张和悦. All rights reserved.
//

import UIKit

final class PopView: UIView {

    @IBOutlet private weak var textLabel: UILabel!

    func set(number: Int, role: Role) {
        textLabel.text = "你的号码是\(number), 你的身份是\(role.description)"
    }

    @IBAction private func finish(_ sender: UIButton) {
        removeFromSuperview()
    }

}
