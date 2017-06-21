//
//  HideView.swift
//  GiftExchange
//
//  Created by Benoît Lévesque on 2017-06-11.
//  Copyright © 2017 Benoît Lévesque. All rights reserved.
//

import UIKit

class HideView: UIView {
    
//    var participantsCount: Int?
    
    // MARK: - Button action
    
    @IBAction func onButtonTapped(_ sender: UIButton) {
        UIView.animate(withDuration: 1.0, animations: {
            self.alpha = 0.0
        }) { (animated) in
            self.isHidden = true
        }
    }
    
    func reset() {
        self.isHidden = false
        self.alpha = 1.0
    }

}
