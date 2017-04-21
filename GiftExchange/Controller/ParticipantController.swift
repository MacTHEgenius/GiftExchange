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
    
    init(_ participant: Participant? = nil, parent: ParticipantsController) {
        self.participant = participant
        self.parent = parent
    }
    
    func pick(_ picked: Participant) {
        // ID
//        if !self.participant!.cantPicked(picked) {
//            self.participant!.cantPicked.append(picked.fullname)
//        }
    }
    
    func unpick(_ unpicked: Participant) {
        // ID
//        if self.participant!.cantPicked(unpicked) {
//            let index = self.participant!.cantPicked.index(of: unpicked.fullname)
//            self.participant!.cantPicked.remove(at: index!)
//        }
    }
    
    func save(firstName: String, lastName: String, nip: String, canPick: [String:Bool]) {
        print(firstName, lastName, nip, canPick)
        let new = Participant(withFirstName: firstName, lastName: lastName, NIP: nip)
        if let p = self.participant {
            self.parent.update(old: p, with: new)
        } else {
            self.parent.add(new)
        }
    }
    
}
