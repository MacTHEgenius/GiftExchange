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
		let action = UIAlertAction(title: "Cancel".localized, style: .cancel, handler: nil)
		self.actionControllerToBuild.addAction(action)
	}
	
	func setOKAction(_ handler: ((UIAlertAction) -> Void)? = nil) {
		let action = UIAlertAction(title: "OK", style: .cancel, handler: handler)
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

class ActionControllerBuildDirector {
	
	static func constructAddParticipant(withHandler handler: @escaping (String, String) -> Void) -> UIAlertController {
		let builder = ActionControllerBuilder()
		
		builder.title = "Add a participant".localized
		builder.message = "First name and last name require.".localized
		
		builder.setAction(withTitle: "Add".localized, actionStyle: .default) { (alert) in
			let textFieldName = builder.itself().textFields![0] as UITextField
			let textFieldNip = builder.itself().textFields![1] as UITextField
			handler(textFieldName.text!, textFieldNip.text!)
		}
		builder.setCancelAction()
		builder.setTextField(withPlaceholder: "First name".localized + " / " + "Last name".localized)
		builder.setTextFieldForNip(withPlaceholder: "NIP".localized)
		
		return builder.build()
	}
	
	static func constructNip(withHandler handler: @escaping (_ nip: String) -> Void) -> UIAlertController {
		let builder = ActionControllerBuilder()
		builder.title = "Protected".localized
		builder.message = "Enter your NIP".localized
		builder.setTextFieldForNip(withPlaceholder: "NIP")
		builder.setAction(withTitle: "Enter".localized, actionStyle: .default) { (alertAction) in
			let textField = builder.itself().textFields![0] as UITextField
			handler(textField.text!)
		}
		builder.setCancelAction()
		
		return builder.build()
	}
	
	static func constructLocked() -> UIAlertController {
		let builder = ActionControllerBuilder()
		builder.title = "Locked".localized
		builder.message = "Re-enter your nip.".localized
		builder.setOKAction()
		return builder.build()
	}
	
	static func constructWarning(_ message: String) -> UIAlertController {
		let builder = ActionControllerBuilder()
		builder.title = "Warning".localized
		builder.message = message
		builder.setOKAction()
		return builder.build()
	}
	
	static func constructTest() -> UIAlertController {
		let builder = ActionControllerBuilder()
		
		builder.title = "Hello, UIActionController"
		builder.message = "This is a test"
		builder.setCancelAction()
		
		return builder.build()
	}
	
}
