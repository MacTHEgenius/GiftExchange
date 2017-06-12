//
//  ResultsTableViewDataSource.swift
//  GiftExchange
//
//  Created by Benoît Lévesque on 2017-06-11.
//  Copyright © 2017 Benoît Lévesque. All rights reserved.
//

import Foundation
import UIKit

class ResultsTableViewDataSource: NSObject {
    
    init(tableView: UITableView) {
        super.init()
        tableView.dataSource = self
    }
    
}

extension ResultsTableViewDataSource: UITableViewDataSource {
    
    struct Id {
        static let result = "Result"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Id.result, for: indexPath)
        cell.textLabel?.text = "Hello"
        return cell
    }
    
}
