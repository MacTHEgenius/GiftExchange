//
//  ParticipantsHelper.swift
//  Swap
//
//  Created by Benoît Lévesque on 2017-06-30.
//  Copyright © 2017 Benoît Lévesque. All rights reserved.
//

import Foundation

class ParticipantHelper {
    
    class func firstnames(of participants: [Participant], for participant: Participant) -> [String] {
        var d = [String]()
        participants.forEach { (p) in
            if participant.cantPick.contains(p.id) {
                d.append(p.firstName)
            }
        }
        return d
    }
    
}
