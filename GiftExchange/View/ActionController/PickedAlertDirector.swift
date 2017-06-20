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
    
    static func picked(_ participant: Participant, completion: @escaping (UIAlertAction) -> Void) -> UIAlertController {
        let alert = UIAlertController(title: "You pick...", message: participant.fullname, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: completion))
        return alert
    }
    
}
