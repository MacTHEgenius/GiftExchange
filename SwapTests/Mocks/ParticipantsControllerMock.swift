//
//  File.swift
//  GiftExchangeTests
//
//  Created by Benoît Lévesque on 2017-06-10.
//  Copyright © 2017 Benoît Lévesque. All rights reserved.
//

import Foundation
@testable import Swap

class ParticipantsControllerMock: ParticipantsController {
    
    // Count
    private var mockCount: Int?
    func setReturnedCount(integer: Int) {
        self.mockCount = integer
    }
    
    override var count: Int {
        get {
            if let mock = self.mockCount {
                return mock
            }
            return super.count
        }
    }
    
}
