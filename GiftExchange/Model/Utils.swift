//
//  Utils.swift
//  GiftExchange
//
//  Created by Benoît Lévesque on 2017-03-27.
//  Copyright © 2017 Benoît Lévesque. All rights reserved.
//

import Foundation

extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
    
    func pluralize(_ count: Int) -> String {
        if self.characters.last == "s" {
            if count < 2 {
                return self.substring(to: self.endIndex)
            }
            return self
        } else {
            if count > 1 {
                return self + "s"
            }
            return self
        }
    }
}
