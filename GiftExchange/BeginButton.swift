//
//  BeginButton.swift
//  GiftExchange
//
//  Created by Benoît Lévesque on 2016-07-28.
//  Copyright © 2016 Benoît Lévesque. All rights reserved.
//

import UIKit

@IBDesignable
class BeginButton: UIButton {
	
	var bezierPath: UIBezierPath!
	
	@IBInspectable
	var color: UIColor! = UIColor.blue
	
	@IBInspectable
	var colorClicked: UIColor! = UIColor.blue
	
	var text: String = "Button" { didSet {
			super.setTitle(self.text, for: UIControlState())
		}
	}

    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
		self.bezierPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: 4.0)
		self.color.setFill()
		self.bezierPath.fill()
		
//		super.layer.cornerRadius = 4.0
//		super.backgroundColor = self.color
		
//		self.addTarget(self, action: #selector(self.touchUpInside), forControlEvents: .TouchUpInside) // Highlighted
//		self.addTarget(self, action: #selector(self.touchDown), forControlEvents: .TouchDown) // Normal
    }
	
	func setButtonEnabled(_ enable: Bool) {
		if enable {
			self.alpha = 1
			self.isEnabled = true
		} else {
			self.alpha = 0.5
			self.isEnabled = false
		}
	}
	
	func touchUpInside() {
		UIGraphicsBeginImageContext(self.bounds.size)
		self.colorClicked.setFill()
		self.bezierPath.fill()
		UIGraphicsEndImageContext()
	}
	
	func touchDown() {
		self.color.setFill()
		self.bezierPath.fill()
	}

}
