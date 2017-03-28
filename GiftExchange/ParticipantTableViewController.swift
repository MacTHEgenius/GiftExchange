//
//  ParticipantTableViewController.swift
//  GiftExchange
//
//  Created by Benoît Lévesque on 2016-07-28.
//  Copyright © 2016 Benoît Lévesque. All rights reserved.
//

import UIKit

class ParticipantTableViewController: UITableViewController {
	
	// MARK: - Constants
	
	static let keyForExchangeObject = "exchangeParticipant"
	
	// MARK: - Properties
	
	var exchange: Exchange!
	
	// MARK: - IBActions
	
	@IBAction func AddParticipant(_ sender: AnyObject) {
		let handler = { (fullName: String, nip: String) -> Void in
			if fullName.isEmpty || nip.isEmpty {
				self.dismiss(animated: true, completion: nil)
				let warningAlert = ActionControllerBuildDirector.constructWarning("First name and last name must not be empty.".localized)
				self.present(warningAlert, animated: true, completion: nil)
			} else {
				let names = fullName.components(separatedBy: "")
				let firstName = names[0]
				var lastName = ""
				if names.count == 2 { lastName = names[1] }
				let participant = Participant(withFirstName: firstName, lastName: lastName, NIP: nip)
				participant.cantPicked.append(participant.fullname)
				self.exchange.participants.append(participant)
				self.tableView.reloadData()
				
				self.saveData()
			}
		}
		let alert = ActionControllerBuildDirector.constructAddParticipant(withHandler: handler)
		self.present(alert, animated: true, completion: nil)
	}
	
	// MARK: - Save and load
	
	func saveData() {
		let tasksAsData = self.exchange.participants.map { task in
			return NSKeyedArchiver.archivedData(withRootObject: task)
		}
		let ud = UserDefaults.standard
		ud.set(tasksAsData, forKey: ParticipantTableViewController.keyForExchangeObject)
	}
	
	func loadData() {
		let ud = UserDefaults.standard
		if let data = ud.object(forKey: ParticipantTableViewController.keyForExchangeObject) as? [Data] {
			self.exchange.participants = data.map { data in
				return NSKeyedUnarchiver.unarchiveObject(with: data) as! Participant
			}
		}
		
//		print("Participant view controller")
//		for p in self.exchange.participants {
//			print(p.firstName)
//			print(p.cantPicked)
//		}
//		print("")
	}
	
	// MARK: - View controller methods

    override func viewDidLoad() {
		super.viewDidLoad()
//		self.title = "Add a participant".localized
		self.exchange = Exchange()
		self.loadData()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
	
	override func viewDidAppear(_ animated: Bool) {
		self.saveData()
	}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.exchange.participants.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "name", for: indexPath)
		
        cell.textLabel?.text = self.exchange.participants[indexPath.row].firstName

        return cell
    }
	
	override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
		let label = UILabel()
		label.text = "\(self.exchange.participants.count) participants"
		label.textColor = UIColor.gray
		label.center.x = self.view.center.x
		label.textAlignment = .center
		return label
	}
	
	override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
		return 50.0
	}

    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
			// Delete the row from the data source
			self.exchange.participants.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
			self.saveData()
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
		self.tableView.reloadData()
    }

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
		if segue.identifier == "showRules" {
			let newVC = segue.destination as! RulesTableViewController
			let indexPath = self.tableView.indexPathForSelectedRow
			newVC.participants = self.exchange.participants
			newVC.participantSelected = self.exchange.participants[indexPath!.row]
		}
    }

}
