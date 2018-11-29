//
//  Role.swift
//  EasyHongHeiYe
//
//  Created by 张和悦 on 2018/11/29.
//  Copyright © 2018 张和悦. All rights reserved.
//

enum Role {
    case police
    case good
    case bad

    var description: String {
        switch self {
        case .police:
            return "警察"
        case .good:
            return "好人"
        case .bad:
            return "坏人"
        }
    }
}
