//
//  ViewChoiceViewController.swift
//  GiftExchange
//
//  Created by Benoît Lévesque on 2016-07-28.
//  Copyright © 2016 Benoît Lévesque. All rights reserved.
//

import UIKit

class ViewChoiceViewController: UIViewController {
	
	var exchange: Exchange!
	var exchangeDone: [Participant:Participant]!
	
	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var switchLabel: UILabel!
	@IBOutlet weak var continueButton: BeginButton!
	@IBOutlet weak var `switch`: UISwitch!
	
	@IBAction func continueAction(_ sender: AnyObject) {
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
		self.exchangeDone = self.exchange.roll()
		
		self.title = "Roll finished !"
		self.titleLabel.text = "All set up !"
		self.switchLabel.text = "Not secret ?"
		self.continueButton.text = "Continue"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
		if let newVC = segue.destination as? ChoiceTableViewController {
			newVC.choices = self.exchangeDone
			newVC.verbose = self.`switch`.isOn
		}
    }

}
