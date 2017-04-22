//
//  Participant.swift
//  GiftExchange
//
//  Created by Benoît Lévesque on 2017-03-27.
//  Copyright © 2017 Benoît Lévesque. All rights reserved.
//

import Foundation

class Participant: NSObject, Validable {
    
    private(set) var id: String
    private(set) var firstName: String
    private(set) var lastName: String
    private(set) var nip: String
    private(set) var chosen: Bool
    private(set) var canPick: [String]
    
    var fullname: String {
        return "\(self.firstName) \(lastName)"
    }
    
    override var description: String {
        return "<\(self.id), \(self.fullname)>"
    }
    
    override var hashValue: Int {
        return self.id.hashValue
    }
    
    init(with firstname: String, and lastName: String, nip: String, canPick: [String:Bool] = [:]) {
        self.id = UUID().uuidString
        self.firstName = firstname
        self.lastName = lastName
        self.nip = nip
        self.chosen = false
        self.canPick = canPick.map({ (key, value) in value ? key : "" }).filter({ (str) in str != "" })
    }
    
    required init(coder aDecoder: NSCoder) {
        self.id = aDecoder.decodeObject(forKey: "id") as! String
        self.firstName = aDecoder.decodeObject(forKey: "firstName") as! String
        self.lastName = aDecoder.decodeObject(forKey: "lastName") as! String
        self.nip = aDecoder.decodeObject(forKey: "nip") as! String
        self.canPick = aDecoder.decodeObject(forKey: "canPicked") as! [String]
        self.chosen = aDecoder.decodeBool(forKey: "chosen")
    }
    
    func encodeWithCoder(_ aCoder: NSCoder) {
        aCoder.encode(self.id, forKey: "id")
        aCoder.encode(self.firstName, forKey: "firstName")
        aCoder.encode(self.lastName, forKey: "lastName")
        aCoder.encode(self.nip, forKey: "nip")
        aCoder.encode(self.canPick, forKey: "canPicked")
        aCoder.encode(self.chosen, forKey: "chosen")
    }
    
    func canPick(_ participant: Participant) -> Bool {
        return self.canPick.contains(participant.id)
    }
    
    func update(_ participant: Participant) {
        self.firstName = participant.firstName
        self.lastName = participant.lastName
        self.canPick = participant.canPick
        self.nip = participant.nip
    }
    
    // Model validations
    
    var errors: [String] = []
    var valid: Bool {
        self.validate()
        return self.errors.isEmpty
    }
    
    func validate() {
        _ = Validate("firstname", of: self).presence(of: self.firstName)
        _ = Validate("lastname", of: self).presence(of: self.lastName)
        _ = Validate("NIP", of: self).presence(of: self.nip).length(of: self.nip, min: 4, max: 6)
    }
    
}

func ==(lhs: Participant, rhs: Participant) -> Bool {
    return lhs.id == rhs.id && lhs.firstName == rhs.firstName && lhs.lastName == rhs.lastName && lhs.nip == rhs.nip
}
