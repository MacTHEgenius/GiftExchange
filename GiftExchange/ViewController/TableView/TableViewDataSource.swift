//
//  TableViewDataSource.swift
//  GiftExchange
//
//  Created by Benoît Lévesque on 2017-03-27.
//  Copyright © 2017 Benoît Lévesque. All rights reserved.
//

import UIKit

class TableViewDataSource: NSObject {
    
    let participantsController: ParticipantsController
    
    init(tableView: UITableView, participantsController: ParticipantsController) {
        self.participantsController = participantsController
        super.init()
        tableView.dataSource = self
    }
    
}

extension TableViewDataSource: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.participantsController.participants.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let participant = self.participantsController.participants[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: ParticipantCell.id, for: indexPath) as! ParticipantCell
        cell.name = participant.firstName
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.participantsController.remove(at: indexPath.row)
        } else if editingStyle == .insert {
            
        }
        tableView.reloadRows(at: [indexPath], with: .fade)
    }
    
}
