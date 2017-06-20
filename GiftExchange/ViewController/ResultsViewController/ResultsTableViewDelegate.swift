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
    
    let parent: ResultsViewController
    let participants: [Participant]
    let results: [Participant:Participant]
    
    init(parent: ResultsViewController, tableView: UITableView, participants controller: ParticipantsController, results: [Participant:Participant]) {
        self.parent = parent
        self.participants = controller.participants
        self.results = results
        super.init()
        tableView.delegate = self
    }
    
}

extension ResultsTableViewDelegate: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let picker = self.participants[indexPath.row]
        let picked = self.results[picker]!
        
        let alert = PickedAlertDirector.picked(picked) { (alertAction) in
            print("completion")
        }
        self.parent.present(alert, animated: true, completion: nil)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
