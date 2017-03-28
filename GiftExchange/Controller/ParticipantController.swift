//
//  SwapController.swift
//  GiftExchange
//
//  Created by Benoît Lévesque on 2017-03-27.
//  Copyright © 2017 Benoît Lévesque. All rights reserved.
//

import Foundation

class ParticipantController {
    
    static let participantsFilePath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first! + "/participants.txt"
    
    private(set) var participants: [Participant] = {
        if let participants = NSKeyedUnarchiver.unarchiveObject(withFile: ParticipantController.participantsFilePath) as? [Participant] {
            return participants
        } else {
            return []
        }
    }()
    
    func addParticipant(participant: Participant) {
        self.participants.append(participant)
    }
    
    func save() {
        NSKeyedArchiver.archiveRootObject(self.participants, toFile: ParticipantController.participantsFilePath)
    }
    
}

