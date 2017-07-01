//
//  ParticipantCell.swift
//  GiftExchange
//
//  Created by Benoît Lévesque on 2017-03-27.
//  Copyright © 2017 Benoît Lévesque. All rights reserved.
//

import UIKit

class ParticipantCell: UITableViewCell {
    
    static let id = "ParticipantCell"

    var name: String? {
        didSet {
            self.textLabel?.text = self.name
        }
    }
    
    var cantPick: [String] = [] {
        didSet {
            self.detailTextLabel?.text = ParticipantCellHelper.detailLabel(names: self.cantPick)
        }
    }

}
