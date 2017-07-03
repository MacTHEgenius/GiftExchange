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
    
    private(set) var cantPick: [String] = []
    
    init(_ participant: Participant? = nil, parent: ParticipantsController) {
        self.participant = participant
        self.parent = parent
        if let participant = self.participant {
            self.cantPick = participant.cantPick
        }
    }
    
    func toggle(_ participant: Participant) throws {
        let count = self.parent.count
        let cantPickCount = self.cantPick.count + 1
        
        if let current = self.participant {
            
            if current.id == participant.id {
                throw ParticipantError.cantToggleYourself
            } else {
                if self.cantPick.contains(participant.id) {
                    self.cantPick.remove(at: self.cantPick.index(of: participant.id)!)
                } else {
                    if count - (cantPickCount + 1) >= 2 {
                        self.cantPick.append(participant.id)
                    } else {
                        throw ParticipantError.notEnoughPicked(count: count - cantPickCount)
                    }
                }
            }
            
        }
    }
    
    func save(_ participant: Participant) throws {
        participant.cantPick = self.cantPick
        
        if participant.valid {
            if let p = self.participant {
                self.parent.update(old: p, with: participant)
            } else {
                self.parent.add(participant)
            }
        } else {
            throw ParticipantError.notValid(errors: participant.errors)
        }
    }
}

enum ParticipantError: Error, Equatable {
    case notValid(errors: [String])
    case cantToggleYourself
    case notEnoughPicked(count: Int)
}

func ==(lhs: ParticipantError, rhs: ParticipantError) -> Bool {
    switch (lhs, rhs) {
    case (.notValid(let leftErrors), .notValid(let rightErrors)): return leftErrors == rightErrors
    default: return true
    }
}
