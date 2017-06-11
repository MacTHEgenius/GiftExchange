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
        
        static let update = "update"
    }
    
    private let participant = ParticipantMock(with: "first", and: "last", nip: "1234")
    private let parent = ParticipantsControllerMock()
    private var controller: ParticipantController!
    
    override func setUp() {
        super.setUp()
        self.controller = ParticipantController(self.participant, parent: self.parent)
    }
    
    func testPick_WithIsPickedTrue() {
        let expected = [Constant.other.id: true]
        
        self.controller.pick(Constant.other, isPicked: true)
        
        XCTAssertEqual(self.controller.canPick, expected)
    }
    
    func testPick_WithIsPickedFalse() {
        let expected = [Constant.other.id: false]
        
        self.controller.pick(Constant.other, isPicked: false)
        
        XCTAssertEqual(self.controller.canPick, expected)
    }
    
    func testSave_ShouldNotThrow_WithAllValid() {
        _ = self.participant.setUpValidateAreInvalid()
        
        XCTAssertNoThrow(try self.controller.save(Constant.other), "save() did throw, but was not supposed to.")
    }
    
    func testSave_ShouldThrowNotValidError_WithInvalidFirstName() {
        let participantToUpdate = ParticipantMock(with: Constant.update, and: Constant.update, nip: Constant.update)
        let expected = participantToUpdate.setUpValidateAreInvalid(first: true)
        
        XCTAssertThrowsError(try self.controller.save(participantToUpdate), "save() did not throw error, but was supposed to.") { (error) in
            XCTAssertEqual(error as! ParticipantError, ParticipantError.notValid(errors: expected))
        }
    }
    
    func testSave_ShouldThrowNotValidError_WithInvalidLastName() {
        let participantToUpdate = ParticipantMock(with: Constant.update, and: Constant.update, nip: Constant.update)
        let expected = participantToUpdate.setUpValidateAreInvalid(last: true)
        
        XCTAssertThrowsError(try self.controller.save(participantToUpdate), "save() did not throw error, but was supposed to.") { (error) in
            XCTAssertEqual(error as! ParticipantError, ParticipantError.notValid(errors: expected))
        }
    }
    
    func testSave_ShouldThrowNotValidError_WithInvalidNip() {
        let participantToUpdate = ParticipantMock(with: Constant.update, and: Constant.update, nip: Constant.update)
        let expected = participantToUpdate.setUpValidateAreInvalid(nip: true)
        
        XCTAssertThrowsError(try self.controller.save(participantToUpdate), "save() did not throw error, but was supposed to.") { (error) in
            XCTAssertEqual(error as! ParticipantError, ParticipantError.notValid(errors: expected))
        }
    }
    
}
