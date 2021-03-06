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
    
    private(set) var participants: [Participant]
    private(set) var results: [Participant:Participant]?
    
    init(parent: ResultsViewController, tableView: UITableView, participants controller: ParticipantsController, results: [Participant:Participant]? = nil) {
        self.parent = parent
        self.participants = controller.participants
        self.results = results
        super.init()
        tableView.delegate = self
    }
    
    func updateData(participants: [Participant], newResults new: [Participant:Participant]) {
        self.participants = participants
        self.results = new
    }
    
}

extension ResultsTableViewDelegate: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if self.results != nil {
            let picker = self.participants[indexPath.row]
            let picked = self.results![picker]!
            
            var completion: UIAlertController = ErrorAlertDirector.error()
            let alert = PromptNipAlertDirector.enterNip { (nip) in
                self.parent.dismiss(animated: true)
                completion = (picker.nip == nip) ? PickedAlertDirector.picked(picked, completion: nil) : ErrorAlertDirector.error(with: "Nip is incorrect.")
                self.parent.present(completion, animated: true)
            }
            self.parent.present(alert, animated: true)
            
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
    
}
