//
//  NipCell.swift
//  GiftExchange
//
//  Created by Benoît Lévesque on 2017-04-19.
//  Copyright © 2017 Benoît Lévesque. All rights reserved.
//

import UIKit

class NipCell: InfoCell, UITextFieldDelegate {
    
    private struct Const {
        static let maxLength = 4
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.nameTextField.delegate = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.nameTextField.delegate = self
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let str: NSString = NSString(string: textField.text!)
        let newString: NSString = str.replacingCharacters(in: range, with: string) as NSString
        return newString.length <= Const.maxLength
    }
    
}
