//
//  ChoicePopOverViewController.swift
//  GiftExchange
//
//  Created by Benoît Lévesque on 2016-07-29.
//  Copyright © 2016 Benoît Lévesque. All rights reserved.
//

import UIKit

class ChoicePopOverViewController: UIViewController {
	
	var picker: Participant!
	var picked: Participant!
//	var locked: Bool!
	
	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var descriptionLabel: UILabel!
	@IBOutlet weak var closeButton: UIButton!
	
	@IBAction func closeAction(_ sender: AnyObject) {
		self.navigationController!.popViewController(animated: true)
	}

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
		self.title = picker.firstName
		self.closeButton.setTitle("Close".localized, for: UIControlState())
		
//		if self.locked! {
//			self.titleLabel.text = "Locked".localized
//			self.descriptionLabel.text = "Re-enter your name.".localized
//		} else {
			self.titleLabel.text = "You picked...".localized
			self.descriptionLabel.text = self.picked.fullname
//		}
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
