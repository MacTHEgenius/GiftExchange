//
//  HideView.swift
//  GiftExchange
//
//  Created by Benoît Lévesque on 2017-06-11.
//  Copyright © 2017 Benoît Lévesque. All rights reserved.
//

import UIKit

class HideView: UIView {
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setupButton()
    }
    
    // MARK: - Private methods
    
    private func setupButton() {
        let frame = CGRect(x: 0, y: 0, width: self.frame.width * 0.8, height: 44.0)
        let button = RoundRectButton(frame: frame)
            
        button.translatesAutoresizingMaskIntoConstraints = true
        button.heightAnchor.constraint(equalToConstant: 44.0).isActive = true
        button.widthAnchor.constraint(equalToConstant: self.frame.width * 0.8).isActive = true
        button.center = CGPoint(x: self.bounds.midX, y: self.bounds.midY)
        button.text = "See results"
        
        button.addTarget(self, action: #selector(onButtonTapped(button:)), for: .touchUpInside)
        
        self.addSubview(button)
    }
    
    // MARK: - Button action
    
    func onButtonTapped(button: UIButton) {
        print("Button tapped 👍")
    }

}
