//
//  SwapController.swift
//  GiftExchange
//
//  Created by Benoît Lévesque on 2017-03-27.
//  Copyright © 2017 Benoît Lévesque. All rights reserved.
//

import Foundation

// Hello

class ParticipantsController {
    
    private static var participantsFilePath: String = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first! + "/participants.txt"
    private var path: String = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first! + "/participants.txt"
    
    init() {
    }
    
    init(with path: String) {
        self.path = path
    }
    
    private(set) var participants: [Participant] = {
        if let participants = NSKeyedUnarchiver.unarchiveObject(withFile: ParticipantsController.participantsFilePath) as? [Participant]  {
            return participants
        } else {
            return []
        }
    }()
    
//    var p: [Participant] {
//        get {
//            guard let participants = NSKeyedUnarchiver.unarchiveObject(withFile: self.path) as? [Participant] else { return [] }
//            return participants
//        }
//    }
    
    var fullNames: [String] {
        return self.participants.map({ (p) -> String in p.fullname })
    }
    
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

