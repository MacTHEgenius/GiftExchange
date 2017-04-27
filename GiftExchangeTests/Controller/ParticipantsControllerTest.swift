//
//  ParticipantsControllerTest.swift
//  GiftExchange
//
//  Created by Benoît Lévesque on 2017-04-23.
//  Copyright © 2017 Benoît Lévesque. All rights reserved.
//

import XCTest
@testable import GiftExchange

class ParticipantsControllerTest: XCTestCase {
    
    let testFilePath = NSTemporaryDirectory() + "test.txt"
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
        if FileManager.default.fileExists(atPath: testFilePath) { // might not work
            try! FileManager.default.removeItem(atPath: testFilePath)
        }
    }
    
    func testRetrieveParticipantsWithoutAnySaved() {
        let controller = ParticipantsController(with: testFilePath)
        
        let retrieved = controller.p
        
        print("Yo", retrieved)
        
        XCTAssertTrue(retrieved.isEmpty, "Participants are not empty.")
    }
    
}
