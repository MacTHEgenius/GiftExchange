//
//  ParticipantMock.swift
//  GiftExchangeTests
//
//  Created by Benoît Lévesque on 2017-06-09.
//  Copyright © 2017 Benoît Lévesque. All rights reserved.
//

import Foundation
@testable import GiftExchange

class ParticipantMock: Participant {
    
    // update
    
    private(set) var updateCalled: Bool = false
    
    override func update(_ participant: Participant) {
        self.updateCalled = true
    }
    
    // validate
    
    private(set) var validateCalled = false
    
    override func validate() {
        self.validateCalled = false
    }
    
    func setUpValidateAreInvalid(first: Bool = false, last: Bool = false, nip: Bool = false) -> [String] {
        if first { self.errors.append("first invalid") }
        if last { self.errors.append("last invalid") }
        if nip { self.errors.append("nip invalid") }
        
        return self.errors
    }
    
}