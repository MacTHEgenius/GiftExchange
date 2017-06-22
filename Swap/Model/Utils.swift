//
//  Utils.swift
//  GiftExchange
//
//  Created by Benoît Lévesque on 2017-03-27.
//  Copyright © 2017 Benoît Lévesque. All rights reserved.
//

import Foundation

public extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
    
    func pluralize(_ count: Int) -> String {
        if self.characters.last == "s" {
            if count < 2 {
                let index = self.index(before: self.endIndex)
                return "\(count) \(self.substring(to: index))"
            }
            return "\(count) \(self)"
        } else {
            if count > 1 {
                return "\(count) \(self)s"
            }
            return "\(count) \(self)"
        }
    }
}
