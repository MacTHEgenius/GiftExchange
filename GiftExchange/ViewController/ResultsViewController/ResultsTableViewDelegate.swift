//
//  ResultsTableViewDelegate.swift
//  GiftExchange
//
//  Created by Benoît Lévesque on 2017-06-11.
//  Copyright © 2017 Benoît Lévesque. All rights reserved.
//

import Foundation
import UIKit

class ResultsTableViewDelegate: NSObject {
    
    init(tableView: UITableView) {
        super.init()
        tableView.delegate = self
    }
    
}

extension ResultsTableViewDelegate: UITableViewDelegate {
    
    
    
}
