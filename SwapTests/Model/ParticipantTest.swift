//
//  ParticipantTest.swift
//  GiftExchange
//
//  Created by Benoît Lévesque on 2017-04-21.
//  Copyright © 2017 Benoît Lévesque. All rights reserved.
//

import XCTest
@testable import Swap

class ParticipantTest: XCTestCase {
    
    private struct Constants {
        static let defaultFn = "Benoit"
        static let defaultLn = "Levesque"
        static let defaultF = "\(Constants.defaultFn) \(Constants.defaultLn)"
        static let defaultNip = "1234"
        
        static let otherFn = "Other"
        static let otherLn = "Name"
        static let otherNip = "5678"
        
        static let notPresent = ""
        static let nipTooShort = "123"
        static let nipTooLong = "1234567"
    }
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testFullname() {
        let participant = Participant(with: Constants.defaultFn, and: Constants.defaultLn, nip: Constants.defaultNip)
        
        let fullname = participant.fullname
        
        XCTAssertEqual(fullname, Constants.defaultF)
    }
    
    func testCanPickDictionaryParsingWhenInitiliaze() {
        let canPickDict = ["hello": true, "world": false, "!": true]
        let participant = Participant(with: Constants.defaultFn, and: Constants.defaultLn, nip: Constants.defaultNip, cantPick: canPickDict)
        
        XCTAssertEqual(participant.cantPick, ["hello", "!"])
    }
    
    // MARK: - CanPick:participant tests
    
    func testCantPickWithPickableParticipant() {
        let participantToPick = Participant(with: Constants.otherFn, and: Constants.otherLn, nip: Constants.defaultNip)
        let participant = Participant(with: Constants.defaultFn, and: Constants.defaultLn, nip: Constants.defaultNip, cantPick: [participantToPick.id:false])
        
        let canPick = participant.canPick(participantToPick)
        
        XCTAssert(canPick, "CantPick should be truthy")
    }
    
    func testCantPickWithUnpickableParticipant() {
        let participantToPick = Participant(with: Constants.otherFn, and: Constants.otherLn, nip: Constants.defaultNip)
        let participant = Participant(with: Constants.defaultFn, and: Constants.defaultLn, nip: Constants.defaultNip, cantPick: [participantToPick.id:true])
        
        let canPick = participant.canPick(participantToPick)
        
        XCTAssertFalse(canPick, "CantPick should be truthy")
    }
    
    // MARK: - Update tests
    
    func testUpdateWithFirstnameUpdated() {
        let old = Participant(with: Constants.defaultFn, and: Constants.defaultLn, nip: Constants.defaultNip)
        let new = Participant(with: Constants.otherFn, and: Constants.defaultLn, nip: Constants.defaultNip)
        
        old.update(new)
        
        XCTAssertEqual(old.firstName, new.firstName)
        XCTAssertEqual(new.firstName, Constants.otherFn)
    }
    
    func testUpdateWithLastnameUpdated() {
        let old = Participant(with: Constants.defaultFn, and: Constants.defaultLn, nip: Constants.defaultNip)
        let new = Participant(with: Constants.defaultFn, and: Constants.otherLn, nip: Constants.defaultNip)
        
        old.update(new)
        
        XCTAssertEqual(old.lastName, new.lastName)
        XCTAssertEqual(new.lastName, Constants.otherLn)
    }
    
    func testUpdateWithNipUpdated() {
        let old = Participant(with: Constants.defaultFn, and: Constants.defaultLn, nip: Constants.defaultNip)
        let new = Participant(with: Constants.defaultFn, and: Constants.defaultLn, nip: Constants.otherNip)
        
        old.update(new)
        
        XCTAssertEqual(old.nip, new.nip)
        XCTAssertEqual(new.nip, Constants.otherNip)
    }
    
    func testUpdateWithCanPickUpdated() {
        let canPickDict = ["hello": true, "world": false, "!": true]
        let old = Participant(with: Constants.defaultFn, and: Constants.defaultLn, nip: Constants.defaultNip)
        let new = Participant(with: Constants.defaultFn, and: Constants.defaultLn, nip: Constants.otherNip, cantPick: canPickDict)
        
        old.update(new)
        
        XCTAssertEqual(old.cantPick, new.cantPick)
        XCTAssertEqual(new.cantPick, ["hello", "!"])
    }
    
    // MARK: - Validate tests
    
    func testValidateWithValidParticipant() {
        let participant = Participant(with: Constants.defaultFn, and: Constants.defaultLn, nip: Constants.defaultNip)
        
        let isValid = participant.valid
        
        XCTAssertTrue(isValid, "isValid should be truthy")
    }
    
    func testValidateWithFirstnameNotPresent() {
        let participant = Participant(with: Constants.notPresent, and: Constants.defaultLn, nip: Constants.defaultNip)
        
        let isValid = participant.valid
        
        XCTAssertFalse(isValid, "isValid should be falsy")
        XCTAssertEqual(participant.errors[0], "Firstname cannot be blank.")
    }
    
    func testValidateWithLastnameNotPresent() {
        let participant = Participant(with: Constants.defaultFn, and: Constants.notPresent, nip: Constants.defaultNip)
        
        let isValid = participant.valid
        
        XCTAssertFalse(isValid, "isValid should be falsy")
        XCTAssertEqual(participant.errors[0], "Lastname cannot be blank.")
    }
    
    func testValidateWithNipNotPresent() {
        let participant = Participant(with: Constants.defaultFn, and: Constants.defaultFn, nip: Constants.notPresent)
        
        let isValid = participant.valid
        
        XCTAssertFalse(isValid, "isValid should be falsy")
        XCTAssertEqual(participant.errors[0], "Nip cannot be blank.")
    }
    
    func testValidateWithNipTooShort() {
        let participant = Participant(with: Constants.defaultFn, and: Constants.defaultFn, nip: Constants.nipTooShort)
        
        let isValid = participant.valid
        
        XCTAssertFalse(isValid, "isValid should be falsy")
        XCTAssertEqual(participant.errors[0], "Nip is too short. (You have 3 characters, minimum is 4)")
    }
    
    func testValidateWithNipTooLong() {
        let participant = Participant(with: Constants.defaultFn, and: Constants.defaultFn, nip: Constants.nipTooLong)
        
        let isValid = participant.valid
        
        XCTAssertFalse(isValid, "isValid should be falsy")
        XCTAssertEqual(participant.errors[0], "Nip is too long. (You have 7 characters, maximum is 6)")
    }
    
    // MARK: - == tests
    
    func testEqualParticipantWithSameParticipant() {
        let participant = Participant(with: Constants.defaultFn, and: Constants.defaultFn, nip: Constants.nipTooLong)
        let sameParticipant = participant
        let (_, _) = (participant.hashValue, participant.description)
        
        XCTAssertTrue(participant == sameParticipant, "\(participant) and \(sameParticipant) are equals")
    }
    
    func testEqualParticipantWithDifferentParticipant() {
        let participant = Participant(with: Constants.defaultFn, and: Constants.defaultFn, nip: Constants.nipTooLong)
        let differentParticipant = Participant(with: Constants.defaultFn, and: Constants.defaultFn, nip: Constants.nipTooLong)
        
        XCTAssertFalse(participant == differentParticipant, "\(participant) and \(differentParticipant) are not equals")
    }
}
