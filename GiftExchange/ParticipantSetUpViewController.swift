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
            self.tableViewDelegate = ParticipantSetUpDelegate(self.tableView, controller: controller)
            
            if let participant = controller.participant {
                self.title = participant.firstName
            } else {
                self.title = "New participant"
            }
        }
        
        let rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(self.didTapSave(sender:)))
        self.navigationItem.rightBarButtonItem = rightBarButtonItem
		
    }
    
    func didTapSave(sender: UIBarButtonItem) {
        print("Save")
        if let dataSource = self.tableViewDataSource, let fname = dataSource.firstnameCell?.value, let lname = dataSource.lastnameCell?.value, let nip = dataSource.nipCell?.value {
            
            let canPick = dataSource.canPickCells.reduce([String:Bool](), { (dict, cell) -> [String:Bool] in
                var d = dict
                d[cell.name!] = cell.check
                return dict
            })
            self.controller?.save(firstName: fname, lastName: lname, nip: nip, canPick: canPick)
        }
        self.navigationController?.popViewController(animated: true)
    }

}
