//
//  BeginButton.swift
//  GiftExchange
//
//  Created by Benoît Lévesque on 2016-07-28.
//  Copyright © 2016 Benoît Lévesque. All rights reserved.
//

import UIKit

class RoundRectButton: UIButton {
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initialize()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.initialize()
    }
    
    func initialize() {
        self.backgroundColor = self.tintColor
        self.setTitleColor(UIColor.white, for: .normal)
        self.layer.cornerRadius = 4.0
        
        self.addTarget(self, action: #selector(touchUpInside(sender:)), for: .touchUpInside)
        self.addTarget(self, action: #selector(touchDown(sender:)), for: .touchDown)
    }
    
    // MARK: - Properties
    
    var text: String = "Button" {
        didSet {
            super.setTitle(self.text, for: UIControlState())
        }
    }
    
    // MARK: - Action methods
    
    func touchUpInside(sender: RoundRectButton) {
//        print("touch up inside")
        self.alpha = 1
    }
    
    func touchDown(sender: RoundRectButton) {
//        print("touch down")
        self.alpha = 0.5
    }

}
