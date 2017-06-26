//
//  HideView.swift
//  GiftExchange
//
//  Created by Benoît Lévesque on 2017-06-11.
//  Copyright © 2017 Benoît Lévesque. All rights reserved.
//

import UIKit

class HideView: UIView {
    
    struct Title {
        static let notQuite = "not_enough".localized
        static let letsSee = "see_results".localized
    }
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var caption: UILabel!
    @IBOutlet weak var seeButton: RoundRectButton!
    
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
        self.seeButton.active = true
    }
    
    func updateView(_ count: Int) {
        self.title.text = count >= 3 ? Title.letsSee : Title.notQuite
        self.caption.text = "participant".pluralize(count) + " \(count != 1 ? "are".localized : "is".localized) " + "registered".localized
        if count < 3 {
            self.caption.text! += ", \("you need".localized) \(3 - count) more"
            self.seeButton.active = false
        }
    }

}
