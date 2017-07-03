//
//  ParticipantControllerTest.swift
//  GiftExchangeTests
//
//  Created by Benoît Lévesque on 2017-06-10.
//  Copyright © 2017 Benoît Lévesque. All rights reserved.
//

import XCTest
@testable import Swap

class ParticipantControllerTest: XCTestCase {
    
    private struct Constant {
        static let other = ParticipantMock(with: "otherFirst", and: "otherLast", nip: "1234", confirmation: "1234")
        
        static let update = "update"
    }
    
    private var participant: ParticipantMock!
    private var parent: ParticipantsControllerMock!
    private var controller: ParticipantController!
    
    override func setUp() {
        super.setUp()
        self.participant = ParticipantMock(with: "first", and: "last", nip: "1234", confirmation: "1234")
        self.parent = ParticipantsControllerMock()
        self.controller = ParticipantController(self.participant, parent: self.parent)
    }
    
    func testToggle_withCurrentParticipant() {
        let expected = [String]()
        
        self.controller.toggle(self.participant)
        
        XCTAssertEqual(self.controller.cantPick, expected)
    }
    
    func testToggle_withParticipantNotPicked() {
        let expected = [Constant.other.id]
        
        self.controller.toggle(Constant.other)
        
        XCTAssertEqual(self.controller.cantPick, expected)
    }
    
    func testPick_withAlreadyParticipantPicked() {
        let expected = [String]()
        self.participant.cantPick = [Constant.other.id]
        self.controller = ParticipantController(self.participant, parent: self.parent)
        
        self.controller.toggle(Constant.other)
        
        XCTAssertEqual(self.controller.cantPick, expected)
    }
    
    func testSave_ShouldNotThrow_WithAllValid() {
        _ = self.participant.setUpValidateAreInvalid()
        
        XCTAssertNoThrow(try self.controller.save(Constant.other), "save() did throw, but was not supposed to.")
    }
    
    func testSave_ShouldThrowNotValidError_WithInvalidFirstName() {
        let participantToUpdate = ParticipantMock(with: Constant.update, and: Constant.update, nip: Constant.update, confirmation: Constant.update)
        let expected = participantToUpdate.setUpValidateAreInvalid(first: true)
        
        XCTAssertThrowsError(try self.controller.save(participantToUpdate), "save() did not throw error, but was supposed to.") { (error) in
            XCTAssertEqual(error as! ParticipantError, ParticipantError.notValid(errors: expected))
        }
    }
    
    func testSave_ShouldThrowNotValidError_WithInvalidLastName() {
        let participantToUpdate = ParticipantMock(with: Constant.update, and: Constant.update, nip: Constant.update, confirmation: Constant.update)
        let expected = participantToUpdate.setUpValidateAreInvalid(last: true)
        
        XCTAssertThrowsError(try self.controller.save(participantToUpdate), "save() did not throw error, but was supposed to.") { (error) in
            XCTAssertEqual(error as! ParticipantError, ParticipantError.notValid(errors: expected))
        }
    }
    
    func testSave_ShouldThrowNotValidError_WithInvalidNip() {
        let participantToUpdate = ParticipantMock(with: Constant.update, and: Constant.update, nip: Constant.update, confirmation: Constant.update)
        let expected = participantToUpdate.setUpValidateAreInvalid(nip: true)
        
        XCTAssertThrowsError(try self.controller.save(participantToUpdate), "save() did not throw error, but was supposed to.") { (error) in
            XCTAssertEqual(error as! ParticipantError, ParticipantError.notValid(errors: expected))
        }
    }
    
    func testSave_ShouldThrowNotValidError_WithInvalidNipConfirmation() {
        let participantToUpdate = ParticipantMock(with: Constant.update, and: Constant.update, nip: Constant.update, confirmation: Constant.update)
        let expected = participantToUpdate.setUpValidateAreInvalid(confirmation: true)
        
        XCTAssertThrowsError(try self.controller.save(participantToUpdate), "save() did not throw error, but was supposed to.") { (error) in
            XCTAssertEqual(error as! ParticipantError, ParticipantError.notValid(errors: expected))
        }
    }
    
}
