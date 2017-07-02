//
//  ParticipantCellHelperTest.swift
//  SwapTests
//
//  Created by Benoît Lévesque on 2017-07-01.
//  Copyright © 2017 Benoît Lévesque. All rights reserved.
//

import XCTest
@testable import Swap

class ParticipantCellHelperTest: XCTestCase {
    
    private struct Constant {
        static let noName = [String]()
        static let oneName = ["First"]
        static let twoNames = ["First", "Second"]
        static let threeNames = ["First", "Second", "Third"]
    }
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testDetailLabelWithNames_shouldDisplayAnyone_withoutAnyNames() {
        let expected = "Anyone 👍"
        
        let result = ParticipantCellHelper.detailLabel(with: Constant.noName)
        
        XCTAssertEqual(expected, result)
    }
    
    func testDetailLabelWithNames_shouldDisplayOneName_withOneName() {
        let expected = "🚫 \(Constant.oneName.first!)"
        
        let result = ParticipantCellHelper.detailLabel(with: Constant.oneName)
        
        XCTAssertEqual(expected, result)
    }
    
    func testDetailLabelWithNames_shouldDisplayTwoNames_withTwoNames() {
        let expected = "🚫 \(Constant.twoNames[0]) & \(Constant.twoNames[1])"
        
        let result = ParticipantCellHelper.detailLabel(with: Constant.twoNames)
        
        XCTAssertEqual(expected, result)
    }
    
    func testDetailLabelWithNames_shouldDisplayOneNameAndTwoOthers_withGreaterThanOrEqualToThreeNames() {
        let expected = "🚫 \(Constant.twoNames[0]) & 2 others"
        
        let result = ParticipantCellHelper.detailLabel(with: Constant.threeNames)
        
        XCTAssertEqual(expected, result)
    }
    
}
