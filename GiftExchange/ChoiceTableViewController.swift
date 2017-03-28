//
//  ChoiceTableViewController.swift
//  GiftExchange
//
//  Created by Benoît Lévesque on 2016-07-28.
//  Copyright © 2016 Benoît Lévesque. All rights reserved.
//

import UIKit

class ChoiceTableViewController: UITableViewController, UIPopoverPresentationControllerDelegate {
	
	var choices: [Participant:Participant]!
	var verbose: Bool!
	var pass: Bool = false
	
	var alert: UIAlertController!
	
	func test() {
		
	}

    override func viewDidLoad() {
        super.viewDidLoad()
		
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
	
	override func viewDidAppear(_ animated: Bool) {
		self.pass = false
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
        return self.choices.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let (picker, picked) = Array(self.choices)[indexPath.row]
//		var cell: UITableViewCell
		
		if self.verbose! {
			let cell = UITableViewCell(style: .value1, reuseIdentifier: "choiceVerbose")
			cell.textLabel!.text = picker.firstName
			cell.detailTextLabel!.text = picked.firstName
			cell.selectionStyle = .blue
			return cell
		} else {
//			let cellToBuild = tableView.dequeueReusableCellWithIdentifier("choice", forIndexPath: indexPath) as! ChoiceTableViewCell
////			cellToBuild.pickerNameLabel.text = picker.firstName
//			cellToBuild.pickerNameLabel.text = picker.firstName
//			cellToBuild.showButton.titleLabel!.text = "Show"
//			cellToBuild.picker = picker
//			cellToBuild.picked = picked
			let cellToBuild = tableView.dequeueReusableCell(withIdentifier: "choiceNotVerbose", for: indexPath)
			cellToBuild.textLabel!.text = picker.firstName
			return cellToBuild
		}
    }
	
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		print("did select row")
		let (picker, _) = Array(self.choices)[indexPath.row]
		
		// Get the new view controller using segue.destinationViewController.
		// Pass the selected object to the new view controller.
		
		if !self.verbose! {
			let alertNip = ActionControllerBuildDirector.constructNip(withHandler: { (nip) in
				print("nip handler")
				if nip == picker.nip {
					self.pass = true
					self.performSegue(withIdentifier: "show", sender: self)
				} else {
					self.pass = false
					let lockedAlert = ActionControllerBuildDirector.constructLocked()
					self.present(lockedAlert, animated: true, completion: nil)
				}
			})
			self.present(alertNip, animated: true, completion: { 
				print("present view controller handler")
			})
		}
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

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		print("prepare for segue")
		if let indexPath = self.tableView.indexPathForSelectedRow {
			let (picker, picked) = Array(self.choices)[indexPath.row]
			let destinationVC = segue.destination as! ChoicePopOverViewController
			destinationVC.picker = picker
			destinationVC.picked = picked
		}
    }
	
	override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
		print("should perform")
		return self.pass
	}
	
	/*
	// MARK: - UI Pop Over Presentation Controller Delegate
	
	func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
		return .None
	}
	*/

}
