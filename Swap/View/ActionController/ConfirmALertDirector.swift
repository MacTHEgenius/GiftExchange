//
//  ConfirmALertDirector.swift
//  Swap
//
//  Created by Benoît Lévesque on 2017-06-28.
//  Copyright © 2017 Benoît Lévesque. All rights reserved.
//

import Foundation
import UIKit

class ConfirmAlertDirector {
    
    struct Title {
        static let `default` = "confirm_title_default".localized
    }
    
    struct Button {
        static let ok = "button_leave".localized
        static let cancel = "cancel".localized
    }
    
    static func confirm(title: String = Title.default, message: String = "", completion: (() -> Void)?) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: Button.ok, style: .default) { (action) in
            if let handler = completion {
                handler()
            }
        })
        alert.addAction(UIAlertAction(title: Button.cancel, style: .cancel))
        
        return alert
    }
    
}
