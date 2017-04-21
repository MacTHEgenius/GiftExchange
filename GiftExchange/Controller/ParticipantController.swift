//
//  ParticipantController.swift
//  GiftExchange
//
//  Created by Benoît Lévesque on 2017-04-15.
//  Copyright © 2017 Benoît Lévesque. All rights reserved.
//

import Foundation

class ParticipantController {
    
    let parent: ParticipantsController
    let participant: Participant?
    
    private var canPick: [String:Bool] = [:]
    
    init(_ participant: Participant? = nil, parent: ParticipantsController) {
        self.participant = participant
        self.parent = parent
        if let participant = self.participant {
            self.canPick = participant.canPick.reduce(self.canPick) { (dict, participantId) -> [String:Bool] in
                var d = dict
                d[participantId] = true
                return d
            }
        }
    }
    
    func pick(_ participant: Participant, isPicked: Bool) {
        self.canPick[participant.id] = isPicked
    }
    
    func save(firstName: String, lastName: String, nip: String) throws {
        let new = Participant(with: firstName, and: lastName, nip: nip, canPick: self.canPick)
        
        if new.valid {
            if let p = self.participant {
                self.parent.update(old: p, with: new)
            } else {
                self.parent.add(new)
            }
        } else {
            throw ParticipantError.notValid(errors: new.errors)
        }
    }
}

enum ParticipantError: Error {
    case notValid(errors: [String])
}
