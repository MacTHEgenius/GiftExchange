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
        
        var completion: UIAlertController = ErrorAlertDirector.error()
        let alert = PromptNipAlertDirectory.enterNip { (nip) in
            self.parent.dismiss(animated: true)
            completion = (picker.nip == nip) ? PickedAlertDirector.picked(picked, completion: nil) : ErrorAlertDirector.error(with: "Nip is incorrect.")
            self.parent.present(completion, animated: true)
        }
        self.parent.present(alert, animated: true)
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
