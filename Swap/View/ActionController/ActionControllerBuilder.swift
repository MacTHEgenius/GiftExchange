//
//  ActionControllerBuilder.swift
//  GeniusDropbox-iOS
//
//  Created by Benoît Lévesque on 2016-07-04.
//  Copyright © 2016 GeniusProd. All rights reserved.
//

import Foundation
import UIKit

protocol ActionControllerBuildable {
	var title: String { get set }
	var message: String { get set }
	
	func setAction(withTitle title: String, actionStyle style: UIAlertActionStyle, handler: @escaping ((UIAlertAction) -> Void))
	func setCancelAction()
	func setOKAction(_ handler: ((UIAlertAction) -> Void)?)
	func setTextField(withPlaceholder placeholder: String)
	func setTextFieldForNip(withPlaceholder placeholder: String)
	func build() -> UIAlertController
	func itself() -> UIAlertController
}

class ActionControllerBuilder: ActionControllerBuildable {

	
	fileprivate var actionControllerToBuild: UIAlertController
	
	init(withStyle style: UIAlertControllerStyle = .alert) {
		self.actionControllerToBuild = UIAlertController(title: "", message: "", preferredStyle: style)
	}
	
	var title: String {
		get {
			return self.actionControllerToBuild.title!
		}
		set {
			self.actionControllerToBuild.title = newValue
		}
	}
	
	var message: String {
		get {
			return self.actionControllerToBuild.message!
		}
		set {
			self.actionControllerToBuild.message = newValue
		}
    }
	
	func setAction(withTitle title: String, actionStyle style: UIAlertActionStyle, handler: @escaping ((UIAlertAction) -> Void)) {
		let action = UIAlertAction(title: title, style: style, handler: handler)
		self.actionControllerToBuild.addAction(action)
	}
    
	func setCancelAction() {
		let action = UIAlertAction(title: "cancel".localized, style: .cancel, handler: nil)
		self.actionControllerToBuild.addAction(action)
	}
	
	func setOKAction(_ handler: ((UIAlertAction) -> Void)? = nil) {
		let action = UIAlertAction(title: "ok".localized, style: .cancel, handler: handler)
		self.actionControllerToBuild.addAction(action)
	}
	
	func setTextField(withPlaceholder placeholder: String) {
		self.actionControllerToBuild.addTextField { (textField) in
			textField.placeholder = placeholder
			textField.borderStyle = .roundedRect
		}
	}
	
	func setTextFieldForNip(withPlaceholder placeholder: String) {
		self.actionControllerToBuild.addTextField { (textField) in
			textField.placeholder = placeholder
			textField.keyboardType = .numberPad
			textField.isSecureTextEntry = true
			textField.spellCheckingType = .no
			textField.autocorrectionType = .no
		}
	}
	
	func build() -> UIAlertController {
		return self.actionControllerToBuild
	}
	
	func itself() -> UIAlertController {
		return self.actionControllerToBuild
	}
	
}
