//
//  ParticipantTableViewController.swift
//  GiftExchange
//
//  Created by Benoît Lévesque on 2016-07-28.
//  Copyright © 2016 Benoît Lévesque. All rights reserved.
//

import UIKit

class ParticipantsTableViewController: UITableViewController {
    
    struct Segue {
        static let showParticipant = "ShowParticipant"
        static let addParticipant = "AddParticipant"
    }
	
	// MARK: - Properties
    
    var participantsController: ParticipantsController?
    var tableViewDataSource: ParticipantsTableViewDataSource?
    var tableViewDelegate: ParticipantsTableViewDelegate?
	
	// MARK: - View controller methods

    override func viewDidLoad() {
		super.viewDidLoad()
        if let participantsController = self.participantsController {
            self.tableViewDataSource = ParticipantsTableViewDataSource(tableView: self.tableView, participantsController: participantsController)
            self.tableViewDelegate = ParticipantsTableViewDelegate(tableView: self.tableView, participantsController: participantsController)
        }
    }
	
	override func viewDidAppear(_ animated: Bool) {
		self.participantsController?.save()
	}
    
    override func viewWillAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }

    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination
        
        switch segue.identifier {
        case Segue.showParticipant?:
            let indexPath = self.tableView.indexPathForSelectedRow!
            let participant = self.participantsController?.participants[indexPath.row]
            (destination as! ParticipantSetUpViewController).controller = self.participantsController?.singleController(participant!)
        case Segue.addParticipant?:
            (destination as! ParticipantSetUpViewController).controller = self.participantsController?.singleController()
        default: break
        }
    }

}
