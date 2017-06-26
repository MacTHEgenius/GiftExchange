//
//  File.swift
//  GiftExchange
//
//  Created by Benoît Lévesque on 2017-06-20.
//  Copyright © 2017 Benoît Lévesque. All rights reserved.
//

import Foundation
import UIKit

class PickedAlertDirector {
    
    struct Title {
        static let pick = "pick".localized
    }
    
    struct Button {
        static let ok = "ok".localized
    }
    
    static func picked(_ participant: Participant, completion: ((UIAlertAction) -> Void)? = nil) -> UIAlertController {
        let alert = UIAlertController(title: Title.pick, message: participant.fullname, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: Button.ok, style: .cancel, handler: completion))
        return alert
    }
    
}
