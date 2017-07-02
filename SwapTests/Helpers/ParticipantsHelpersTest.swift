//
//  ParticipantsHelpersTest.swift
//  SwapTests
//
//  Created by Benoît Lévesque on 2017-06-30.
//  Copyright © 2017 Benoît Lévesque. All rights reserved.
//

import XCTest
@testable import Swap

class ParticipantsHelpersTest: XCTestCase {
    
    struct Constant {
        static let participants = [
            ParticipantMock(with: "firstname1", and: "lastname1", nip: "1234", confirmation: "1234"),
            ParticipantMock(with: "firstname2", and: "lastname2", nip: "1234", confirmation: "1234")
        ]
        static let cantPicked = [Constant.participants.first!.id]
        static let participant = ParticipantMock(with: "firstname", and: "lastname", nip: "1234", confirmation: "1234")
    }
    
    override func setUp() {
        super.setUp()
        
        Constant.participant.cantPick = Constant.cantPicked
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testfirstnameOfParticipantsForParticipant() {
        let expected = [Constant.participants.first!.firstName]
        
        let result = ParticipantHelper.firstnames(of: Constant.participants, for: Constant.participant)
        
        XCTAssertEqual(expected, result)
    }
    
}
