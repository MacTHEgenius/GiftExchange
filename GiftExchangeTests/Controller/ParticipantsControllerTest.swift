//
//  ParticipantsControllerTest.swift
//  GiftExchange
//
//  Created by Benoît Lévesque on 2017-04-23.
//  Copyright © 2017 Benoît Lévesque. All rights reserved.
//

import XCTest
@testable import GiftExchange

/*
class ParticipantsControllerTest: XCTestCase {
    
    let testFilePath = NSTemporaryDirectory() + "test.txt"
    
    struct Constants {
        static let participant = ParticipantMock(with: "first", and: "last", nip: "1234")
    }
    
    override func setUp() {
        super.setUp()
        self.clear()
    }
    
    override func tearDown() {
        super.tearDown()
        self.clear()
    }
    
    private func clear() {
        if FileManager.default.fileExists(atPath: testFilePath) { // might not work
            try! FileManager.default.removeItem(atPath: testFilePath)
            print("removed")
        } else {
            print("not removed")
        }
    }
    
    func testRetrieveParticipantsWithoutAnySaved() {
        let controller = ParticipantsController(with: testFilePath)
        
        let retrieved = controller.participants
        
        print("Yo", retrieved)
        
        XCTAssertTrue(retrieved.isEmpty, "Participants are not empty.")
    }
    
    func testAdd() {
        let controller = ParticipantsController(with: testFilePath)
        
        controller.add(Constants.participant)
        let retrieved = controller.participants
        print(controller.fullNames)
        
        XCTAssertEqual(retrieved.count, 1)
    }
    
    func testRemove() {
        let controller = ParticipantsController(with: testFilePath)
        controller.add(Constants.participant)
        
        let participantIndex = controller.participants.index { (p) -> Bool in p.id == Constants.participant.id }
        controller.remove(at: participantIndex!)
        let retrieved = controller.participants
        
        XCTAssertEqual(retrieved.count, 0)
    }
    
    func testUpdate() {
        let controller = ParticipantsController(with: testFilePath)
        let participantToUpdate = ParticipantMock(with: "A name", and: "A lastname", nip: "1234")
        
        controller.update(old: participantToUpdate, with: Constants.participant)
        
        XCTAssertTrue(participantToUpdate.updateCalled, "Update was not called by the model.")
    }
    
    func testFullnames() {
        let controller = ParticipantsController(with: testFilePath)
        controller.add(Constants.participant)
        
        let fullnames = controller.fullNames
        
        XCTAssertEqual(fullnames, [Constants.participant.fullname])
    }
    
    func testFirstnames() {
        let controller = ParticipantsController(with: testFilePath)
        controller.add(Constants.participant)
        
        let firstnames = controller.firstNames
        
        XCTAssertEqual(firstnames, [Constants.participant.firstName])
    }
    
    func testSingleControllerForParticipant() {
        let controller = ParticipantsController(with: testFilePath)
        
        let singleController = controller.singleController()
        
        XCTAssertTrue(singleController.parent === controller)
    }
}
 */
