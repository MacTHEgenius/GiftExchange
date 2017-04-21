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
	
	// MARK: - IBActions
	
	@IBAction func AddParticipant(_ sender: AnyObject) {
//		let handler = { (fullName: String, nip: String) -> Void in
//			if fullName.isEmpty || nip.isEmpty {
//				self.dismiss(animated: true, completion: nil)
//				let warningAlert = ActionControllerBuildDirector.constructWarning("First name and last name must not be empty.".localized)
//				self.present(warningAlert, animated: true, completion: nil)
//			} else {
//				let names = fullName.components(separatedBy: "")
//				let firstName = names[0]
//				var lastName = ""
//				if names.count == 2 { lastName = names[1] }
//				let participant = Participant(withFirstName: firstName, lastName: lastName, NIP: nip)
//				participant.cantPicked.append(participant.fullname)
//				self.exchange.participants.append(participant)
//				self.tableView.reloadData()
//				
//				self.saveData()
//			}
//		}
//		let alert = ActionControllerBuildDirector.constructAddParticipant(withHandler: handler)
//		self.present(alert, animated: true, completion: nil)
	}
	
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
