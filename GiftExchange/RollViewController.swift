//
//  RollViewController.swift
//  GiftExchange
//
//  Created by Benoît Lévesque on 2016-07-28.
//  Copyright © 2016 Benoît Lévesque. All rights reserved.
//

import UIKit

class RollViewController: UIViewController {
	
	var participants: [Participant]!
	
	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var beginButton: BeginButton!
	@IBOutlet weak var descriptionLabel: UILabel!
	
	// MARK: - IBAction
	
	@IBAction func rollAction(_ sender: AnyObject) {
//		print("Button tapped")
	}
	
	// MARK: - Load
	
	func loadData() {
		let ud = UserDefaults.standard
		if let data = ud.object(forKey: ParticipantTableViewController.keyForExchangeObject) as? [Data] {
			self.participants = data.map { data in
				return NSKeyedUnarchiver.unarchiveObject(with: data) as! Participant
			}
		}
	}
	
	
	// MARK: - Override

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
		self.loadData()
//		self.title = "Roll !".localized
		self.titleLabel.text = "Draw lots".localized
		self.beginButton.text = "Roll !".localized
		
//		print("Roll view controller")
//		for p in self.participants {
//			print(p.fullname)
//			print(p.cantPicked)
//		}
    }
	
	override func viewWillAppear(_ animated: Bool) {
		self.loadData()
		if self.participants.count >= 3 {
			self.descriptionLabel.text = "\(self.participants.count)" + " participants are registered.".localized
			self.beginButton.setButtonEnabled(true)
		} else if self.participants.count == 1 {
			self.descriptionLabel.text = "Register 3 or more participants. Currently, ".localized + "\(self.participants.count)" + " participant is registered.".localized
			self.beginButton.setButtonEnabled(false)
		} else {
			self.descriptionLabel.text = "Register 3 or more participants. Currently, ".localized + "\(self.participants.count)" + " participants are registered.".localized
			self.beginButton.setButtonEnabled(false)
		}
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
		if let newVC = segue.destination as? ViewChoiceViewController {
//			newVC.exchange = Exchange()
//			newVC.exchange.participants = self.participants
		}
    }

}
