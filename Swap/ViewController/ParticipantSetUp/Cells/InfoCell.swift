//
//  NameCell.swift
//  GiftExchange
//
//  Created by Benoît Lévesque on 2017-04-17.
//  Copyright © 2017 Benoît Lévesque. All rights reserved.
//

import UIKit

class InfoCell: UITableViewCell {
    
    static let id = "Info"

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var nameLabel: UILabel!
    
    var value: String? {
        get {
            return self.nameTextField.text != nil ? self.nameTextField.text! : ""
        }
        set {
            self.nameTextField.text = newValue
        }
    }

}
