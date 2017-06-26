//
//  PromptNipAlertDirectory.swift
//  GiftExchange
//
//  Created by Benoît Lévesque on 2017-06-20.
//  Copyright © 2017 Benoît Lévesque. All rights reserved.
//

import Foundation
import UIKit

class PromptNipAlertDirector {
    
    struct Title {
        static let enter = "nip_title".localized
    }
    
    struct Message {
        static let `default` = "nip_message".localized
    }
    
    struct Button {
        static let ok = "button_ok".localized
        static let cancel = "button_cancel".localized
    }
    
    static func enterNip(completion: @escaping ((_ nip: String) -> Void)) -> UIAlertController {
        let alert = UIAlertController(title: Title.enter, message: Message.default, preferredStyle: .alert)
        alert.addTextField { (textfield) in
            textfield.keyboardType = .numberPad
            textfield.placeholder = "nip_placeholder".localized
            textfield.textAlignment = .center
            textfield.isSecureTextEntry = true
        }
        alert.addAction(UIAlertAction(title: Button.cancel, style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: Button.ok, style: .default) { (alertAction) in
            let text = alert.textFields![0].text
            if let nip = text {
                completion(nip)
            }
        })
        
        return alert
    }
    
}
