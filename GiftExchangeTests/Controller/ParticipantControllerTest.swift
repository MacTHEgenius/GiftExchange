//
//  ParticipantControllerTest.swift
//  GiftExchangeTests
//
//  Created by Benoît Lévesque on 2017-06-10.
//  Copyright © 2017 Benoît Lévesque. All rights reserved.
//

import XCTest
@testable import GiftExchange

class ParticipantControllerTest: XCTestCase {
    
    private struct Constant {
        static let other = ParticipantMock(with: "otherFirst", and: "otherLast", nip: "1234")
    }
    
    private let participant = ParticipantMock(with: "first", and: "last", nip: "1234")
    private let parent = ParticipantsControllerMock()
    private var controller: ParticipantController!
    
    override func setUp() {
        super.setUp()
        self.controller = ParticipantController(self.participant, parent: self.parent)
    }
    
    func testExample() {
        XCTAssertTrue(true, "Falsy is truty")
    }
    
}
