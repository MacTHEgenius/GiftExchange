//
//  ParticipantCanPickCell.swift
//  GiftExchange
//
//  Created by Benoît Lévesque on 2017-04-15.
//  Copyright © 2017 Benoît Lévesque. All rights reserved.
//

import UIKit

class ParticipantCanPickCell: UITableViewCell {

    static let id = "ParicipantCanPickCell"
    
    var name: String? {
        didSet {
            self.textLabel?.text = self.name
        }
    }
    
    var check: Bool = true {
        didSet {
            self.accessoryType = self.check ? .checkmark : .none
        }
    }

}
