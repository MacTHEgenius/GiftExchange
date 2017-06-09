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
    private(set) var updateCalled: Bool = false
    
    override func update(_ participant: Participant) {
        self.updateCalled = true
    }
}
