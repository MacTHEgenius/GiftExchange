//
//  AlertControllerDirector.swift
//  GiftExchange
//
//  Created by Benoît Lévesque on 2017-05-24.
//  Copyright © 2017 Benoît Lévesque. All rights reserved.
//

import Foundation
import UIKit

class ErrorAlertDirector {
    
    struct Title {
        static let errors = "There were some errors"
        static let error = "There was an error"
    }
    
    struct Message {
        static let `default` = "Oops... Some error occured..."
    }
    
    struct Button {
        static let ok = "OK"
    }
    
    static func errors(with errors: [String]) -> UIAlertController {
        
        let title = errors.count > 1 ? Title.errors : Title.error
        let alert = UIAlertController(title: title, message: "", preferredStyle: .alert)
        
        var message = ""
        errors.forEach { (error) in
            message += error + (error == errors.last ? "" : "\n")
        }
        
        alert.message = message
        alert.addAction(UIAlertAction(title: Button.ok, style: .cancel, handler: nil))
        
        return alert
        
    }
    
    static func error(with message: String? = nil) -> UIAlertController {
        let msg = message ?? Message.default
        let alert = UIAlertController(title: Title.error, message: msg, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: Button.ok, style: .cancel, handler: nil))
        
        return alert
    }
    
}
