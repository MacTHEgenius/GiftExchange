//
//  ParticipantSetUpDelegate.swift
//  GiftExchange
//
//  Created by Benoît Lévesque on 2017-04-15.
//  Copyright © 2017 Benoît Lévesque. All rights reserved.
//

import Foundation
import UIKit

class ParticipantSetUpDelegate: NSObject {
    
    let controller: ParticipantController
    
    init(_ tableView: UITableView, controller: ParticipantController) {
        self.controller = controller
        super.init()
        tableView.delegate = self
    }
    
}

extension ParticipantSetUpDelegate: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == ParticipantSetUpDataSource.Const.section - 1 {
            let cell = tableView.cellForRow(at: indexPath) as! ParticipantCanPickCell
            let participantSelected = self.controller.parent.participants[indexPath.row]
            
            if cell.check {
                self.controller.pick(participantSelected)
                cell.check = false
            } else {
                self.controller.unpick(participantSelected)
                cell.check = true
            }
            print(cell.check)
            cell.accessoryType = .checkmark
            
            
            tableView.reloadData()            
        }
    }
    
}
