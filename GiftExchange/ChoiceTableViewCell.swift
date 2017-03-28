//
//  ChoiceTableViewCell.swift
//  GiftExchange
//
//  Created by Benoît Lévesque on 2016-07-29.
//  Copyright © 2016 Benoît Lévesque. All rights reserved.
//

import UIKit

class ChoiceTableViewCell: UITableViewCell {
	
	var picker: Participant!
	var picked: Participant!
	
	
	@IBOutlet weak var pickerNameLabel: UILabel!
	@IBOutlet weak var showButton: UIButton!
	
	@IBAction func showAction(_ sender: AnyObject) {
		print("Button tapped")
	}

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
//		if let p = self.pickerNameLabel {
//			print("not nil !")
//		} else {
//			print("nil...")
//		}
		
//		self.pickerNameLabel.text = "test"
//		self.showButton.titleLabel!.text = "Show"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
