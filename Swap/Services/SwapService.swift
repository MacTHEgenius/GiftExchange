//
//  SwapService.swift
//  GiftExchange
//
//  Created by Benoît Lévesque on 2017-03-27.
//  Copyright © 2017 Benoît Lévesque. All rights reserved.
//

import Foundation

class SwapService {
    
    var reroll: Bool = true
    
    private var participantsController: ParticipantsController
    
    init(participantController: ParticipantsController) {
        self.participantsController = participantController
    }
    
    func roll() -> [Participant: Participant] {
        var dispatch = [Participant:Participant]()
        var list = self.participantsController.participants
        
        for p in list {
            var picked: Participant
            print(p.fullname, "is choosing...")
            
            repeat {
                let index = Int(arc4random_uniform(UInt32(list.count)))
                picked = list[index]
                
                print("->", picked.fullname, "was picked...")
                
                if p.canPick(picked) {
                    print("---> ok")
                    dispatch[p] = picked
                    list.remove(at: index)
                } else if list.count == 1 {
                    print("\n\nCount to 1\n\n")
                    break
                }
            } while !p.canPick(picked)
            
        }
        
        if list.count == 1 {
            dispatch = self.roll()
        }
        
        return dispatch
    }
    
}
