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
    
    private(set) var participants: [String]
    
    init(tableView: UITableView, participants controller: ParticipantsController) {
        self.participants = controller.firstNames
        super.init()
        tableView.dataSource = self
    }
    
    func updateData(participants: [String]) {
        self.participants = participants
    }
    
}

extension ResultsTableViewDataSource: UITableViewDataSource {
    
    struct Id {
        static let result = "Result"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.participants.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let name = self.participants[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Id.result, for: indexPath)
        cell.textLabel?.text = name
        return cell
    }
    
}
