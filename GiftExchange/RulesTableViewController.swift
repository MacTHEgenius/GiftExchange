//
//  RulesTableViewController.swift
//  GiftExchange
//
//  Created by Benoît Lévesque on 2016-07-31.
//  Copyright © 2016 Benoît Lévesque. All rights reserved.
//

import UIKit

class RulesTableViewController: UITableViewController {
	
	var participantSelected: Participant!
	var participants: [Participant]!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
		
		self.title = self.participantSelected.firstName + " can't pick...".localized
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
	
	override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		return self.participantSelected.firstName + " can't pick...".localized
	}

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.participants.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "rule", for: indexPath)

        // Configure the cell...
		let participant = self.participants![indexPath.row]
		cell.textLabel!.text = participant.fullname
		print(participant.fullname)
		print(self.participantSelected.cantPicked)
		print(self.participantSelected.cantPicked.contains(participant.fullname))
		if self.participantSelected.cantPicked.contains(participant.fullname) {
			cell.accessoryType = .checkmark
		}

        return cell
    }
	
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let cell = tableView.cellForRow(at: indexPath)
		
		if cell!.accessoryType == .none {
			cell!.accessoryType = .checkmark
			if !self.participantSelected.cantPicked.contains(self.participants[indexPath.row].fullname) {
				self.participantSelected.cantPicked.append(self.participants[indexPath.row].fullname)
			}
		} else if cell!.accessoryType == .checkmark {
			cell!.accessoryType = .none
			if self.participantSelected.cantPicked.contains(self.participants[indexPath.row].fullname) {
				self.participantSelected.cantPicked.remove(at: self.participantSelected.cantPicked.index(of: self.participants![indexPath.row].fullname)!)
			}
		}
		self.tableView.reloadData()
		print(self.participantSelected.cantPicked)
	}

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
