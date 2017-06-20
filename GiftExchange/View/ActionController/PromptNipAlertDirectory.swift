//
//  PromptNipAlertDirectory.swift
//  GiftExchange
//
//  Created by Benoît Lévesque on 2017-06-20.
//  Copyright © 2017 Benoît Lévesque. All rights reserved.
//

import Foundation
import UIKit

class PromptNipAlertDirectory {
    
    static func enterNip(completion: @escaping ((_ nip: String) -> Void)) -> UIAlertController {
        let alert = UIAlertController(title: "Enter your nip...", message: "You can spoof other people you know...", preferredStyle: .alert)
        alert.addTextField { (textfield) in
            textfield.keyboardType = .numberPad
            textfield.placeholder = "NIP"
        }
        alert.addAction(UIAlertAction(title: "I'll show myself out...", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "It's me, I promise !", style: .default) { (alertAction) in
            let text = alert.textFields![0].text
            if let nip = text {
                completion(nip)
            }
        })
        
        return alert
    }
    
}
