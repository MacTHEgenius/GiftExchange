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
    
    let delegated: ParticipantSetUpViewController
    let controller: ParticipantController
    
    init(_ tableView: UITableView, controller: ParticipantController, delegated: ParticipantSetUpViewController) {
        self.delegated = delegated
        self.controller = controller
        super.init()
        tableView.delegate = self
    }
    
}

extension ParticipantSetUpDelegate: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == ParticipantSetUpDataSource.Const.section - 1 {
            let cell = tableView.cellForRow(at: indexPath) as! ParticipantCantPickCell
            let participantSelected = self.controller.parent.participants[indexPath.row]
            
            do {
                try self.controller.toggle(participantSelected)
                cell.select()
            } catch ParticipantError.notEnoughPicked(_) {
                cell.setSelected(false, animated: true)
                let alert = ErrorAlertDirector.error(with: "You have to be able to pick at least 2 participants.")
                self.delegated.present(alert, animated: true)
            } catch {}
        }
    }
    
}
