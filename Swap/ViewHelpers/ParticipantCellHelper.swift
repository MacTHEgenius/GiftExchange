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
        
        switch names.count {
        case 0:
            text = "Anyone 👍"
        case 1:
            text = "🚫 \(names.first!)"
        case 2:
            text = "🚫 \(names.first!) & \(names.last!)"
        default:
            text = "🚫 \(names.first!) & \("other".pluralize(names.count - 1))"
        }
        
        return text
    }
    
}
