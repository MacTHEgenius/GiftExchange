//
//  Validation.swift
//  GiftExchange
//
//  Created by Benoît Lévesque on 2017-04-20.
//  Copyright © 2017 Benoît Lévesque. All rights reserved.
//

import Foundation

protocol Validable {
    var valid: Bool { get }
    var errors: [String] { get set }
    func validate()
}

class Validate {
    
    var validate: Validable
    var field: String
    
    init(_ field: String, of validate: Validable) {
        self.field = field
        self.validate = validate
    }
    
    func presence<T>(of value: T) -> Validate {
        let rule = (value is String && (value as! String) == "")
        return self.execute(rule, error: .blank(field: self.field))
    }
    
    func length(of value: String, min: Int = 0, max: Int = Int.max) -> Validate {
        let n = value.characters.count
        let rule = n < min || n > max
        return self.execute(rule, error: .stringLength(field: self.field, short: n < min, maxOrMin: n >= min ? max : min, current: n))
    }
    
    func customRule(errorMessage msg: String, _ rule: () -> Bool) -> Validate {
        return self.execute(!rule(), error: .custom(msg: msg))
    }
    
    private func execute(_ validation: Bool, error: ValidationError) -> Validate {
        if validation {
            self.validate.errors.append(error.localizedDescription)
        }
        return self
    }
    
}

enum ValidationError: Error {
    case blank(field: String)
    case stringLength(field: String, short: Bool, maxOrMin: Int, current: Int)
    case custom(msg: String)
    
    var localizedDescription: String {
        switch self {
            case .blank(let field): return "\(field.capitalized) cannot be blank."
        case .stringLength(let field, let short, let maxOrMin, let current): return "\(field.capitalized) is too \(short ? "short" : "long"). (You have \(current) \("character".pluralize(current)), \(short ? "minimum" : "maximum") is \(maxOrMin))"
            case .custom(let msg):  return msg
        }
    }
}
