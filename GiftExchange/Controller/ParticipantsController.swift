//
//  SwapController.swift
//  GiftExchange
//
//  Created by Benoît Lévesque on 2017-03-27.
//  Copyright © 2017 Benoît Lévesque. All rights reserved.
//

import Foundation

class ParticipantsController {
    
    static let participantsFilePath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first! + "/participants.txt"
    
    var fullNames: [String] {
        return self.participants.map({ (p) -> String in p.fullname })
    }
    
    private(set) var participants: [Participant] = {
        if let participants = NSKeyedUnarchiver.unarchiveObject(withFile: ParticipantsController.participantsFilePath) as? [Participant] {
            return participants
        } else {
            return []
        }
    }()
    
    var count: Int {
        return self.participants.count
    }
    
    func add(_ participant: Participant) {
        self.participants.append(participant)
    }
    
    func remove(at index: Int) {
        self.participants.remove(at: index)
    }
    
    func update(old: Participant, with new: Participant) {
        old.update(new)
    }
    
    func save() {
        NSKeyedArchiver.archiveRootObject(self.participants, toFile: ParticipantsController.participantsFilePath)
    }
    
    // Single participant
    
    func singleController(_  participant: Participant? = nil) -> ParticipantController {
        return ParticipantController(participant, parent: self)
    }
    
}

