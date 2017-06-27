//
//  CellBuilder.swift
//  GiftExchange
//
//  Created by Benoît Lévesque on 2017-04-19.
//  Copyright © 2017 Benoît Lévesque. All rights reserved.
//

import Foundation
import UIKit

protocol CellBuildable {
    var cell: InfoCell { get }
    func label()
    func placeholder()
    func entry()
}
 
class FirstnameBuilder: CellBuildable {
    var cell: InfoCell

    init(with cell: InfoCell, and value: String? = nil) {
        self.cell = cell
        self.cell.value = value
        self.cell.selectionStyle = .none
    }
    
    func label() {
        self.cell.nameLabel.text = "firstname".localized
    }
    
    func placeholder() {
        self.cell.nameTextField.placeholder = "firstname_placeholder".localized
    }
    
    func entry() {
        self.cell.nameTextField.keyboardType = .default
        self.cell.nameTextField.isSecureTextEntry = false
    }
    
}

class LastnameBuilder: FirstnameBuilder {
    
    override func label() {
        self.cell.nameLabel.text = "lastname".localized
    }
    
    override func placeholder() {
        self.cell.nameTextField.placeholder = "lastname_placholder".localized
    }
    
}

class NipBuilder: CellBuildable {
    var cell: InfoCell
    
    init(with cell: InfoCell, and value: String? = nil) {
        self.cell = cell
        self.cell.value = value
        self.cell.selectionStyle = .none
    }
    
    func label() {
        self.cell.nameLabel.text = "nip".localized
    }
    
    func placeholder() {
        self.cell.nameTextField.placeholder = "nip_placeholder".localized
    }
    
    func entry() {
        self.cell.nameTextField.keyboardType = .numberPad
        self.cell.nameTextField.isSecureTextEntry = true
    }
    
}

class CellDirector {
    func build(builder: CellBuildable) -> InfoCell {
        builder.label()
        builder.placeholder()
        builder.entry()
        return builder.cell
    }
}
