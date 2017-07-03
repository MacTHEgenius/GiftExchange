//
//  RulesTableViewController.swift
//  GiftExchange
//
//  Created by Benoît Lévesque on 2016-07-31.
//  Copyright © 2016 Benoît Lévesque. All rights reserved.
//

import UIKit

class ParticipantSetUpViewController: UITableViewController {
    
    var controller: ParticipantController?
    var tableViewDataSource: ParticipantSetUpDataSource?
    var tableViewDelegate: ParticipantSetUpDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let controller = self.controller {
            self.tableViewDataSource = ParticipantSetUpDataSource(self.tableView, controller: controller)
            self.tableViewDelegate = ParticipantSetUpDelegate(self.tableView, controller: controller, delegated: self)
            
            if let participant = controller.participant {
                self.title = participant.firstName
            } else {
                self.title = "new_participant".localized
            }
        }
        
        let rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(self.didTapSave(sender:)))
        self.navigationItem.rightBarButtonItem = rightBarButtonItem
		
    }
    
    func didTapSave(sender: UIBarButtonItem) {
        guard let dataSource = self.tableViewDataSource,
              let fname = dataSource.firstnameCell?.value,
              let lname = dataSource.lastnameCell?.value,
              let nip = dataSource.nipCell?.value,
              let confirmation = dataSource.nipConfirmationCell?.value
        else {
            print("Errors (value's nil)")
            return
        }
        
        do {
            let new = Participant(with: fname, and: lname, nip: nip, confirmation: confirmation)
            try self.controller?.save(new)
            self.navigationController?.popViewController(animated: true)
        } catch ParticipantError.notValid(let errors) {
            let alert = ErrorAlertDirector.errors(with: errors)
            self.present(alert, animated: true, completion: nil)
        } catch {
            print("wat")
        }
        
    }

}
