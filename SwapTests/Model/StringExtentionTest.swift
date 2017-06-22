//
//  StringExtention.swift
//  GiftExchange
//
//  Created by Benoît Lévesque on 2017-04-22.
//  Copyright © 2017 Benoît Lévesque. All rights reserved.
//

import XCTest

class StringExtentionTest: XCTestCase {
    
    struct Constants {
        struct String {
            static let noS = "cat"
            static let s = "cats"
        }
        struct Count {
            static let lessThan2 = 1
            static let moreThan1 = 2
        }
    }
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testPluralize_WithCountToLessThan2_WhenStringHasS() {
        let result = Constants.String.s.pluralize(Constants.Count.lessThan2)
        
        XCTAssertEqual(result, "1 cat")
    }
    
    func testPluralize_WithCountToMoreThan1_WhenStringHasS() {
        let result = Constants.String.s.pluralize(Constants.Count.moreThan1)
        
        XCTAssertEqual(result, "2 cats")
    }
    
    func testPluralize_WithCountToLessThan2_WhenStringHasNoS() {
        let result = Constants.String.noS.pluralize(Constants.Count.lessThan2)
        
        XCTAssertEqual(result, "1 cat")
    }
    
    func testPluralize_WithCountToMoreThan1_WhenStringHasNoS() {
        let result = Constants.String.noS.pluralize(Constants.Count.moreThan1)
        
        XCTAssertEqual(result, "2 cats")
    }
    
}
