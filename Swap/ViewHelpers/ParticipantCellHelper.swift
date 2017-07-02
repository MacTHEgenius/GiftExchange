//
//  ParticipantCellHelper.swift
//  Swap
//
//  Created by Benoît Lévesque on 2017-06-30.
//  Copyright © 2017 Benoît Lévesque. All rights reserved.
//

import Foundation

class ParticipantCellHelper {
    
    class func detailLabel(with names: [String]) -> String {
        var text: String
        if names.isEmpty {
            text = "Anyone 👍"
        } else {
            let count = names.count
            text = "🚫 "
            if count <= 2 {
                text += count == 2 ? "\(names.first!) & \(names.last!)" : "\(names.first!)"
            } else {
                text += "\(names.first!) & \("other".pluralize(count - 1))"
            }
        }
        return text
    }
    
}
