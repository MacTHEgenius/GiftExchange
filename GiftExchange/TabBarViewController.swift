//
//  TabBarViewController.swift
//  GiftExchange
//
//  Created by Benoît Lévesque on 2016-07-28.
//  Copyright © 2016 Benoît Lévesque. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {
	
	var participantViewController: ParticipantTableViewController!
	var rollViewController: RollViewController!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
		self.participantViewController = self.childViewControllers[0].childViewControllers[0] as! ParticipantTableViewController
		self.rollViewController = self.childViewControllers[1].childViewControllers[0] as! RollViewController
		
		self.participantViewController.title = "Add a participant".localized
		self.rollViewController.title = "Roll !".localized
		
		/*
		let exchange = Exchange()
		let p1 = Participant(withFirstName: "a", lastName: "a", NIP: "")
		let p2 = Participant(withFirstName: "b", lastName: "b", NIP: "")
		let p3 = Participant(withFirstName: "c", lastName: "c", NIP: "")
		let p4 = Participant(withFirstName: "d", lastName: "d", NIP: "")
		let p5 = Participant(withFirstName: "e", lastName: "e", NIP: "")
		p1.cantPicked.append(p1)
		p1.cantPicked.append(p2)
		p1.cantPicked.append(p3)
		p1.cantPicked.append(p4)
		
		exchange.participants.append(p1)
		exchange.participants.append(p2)
		exchange.participants.append(p3)
		exchange.participants.append(p4)
		exchange.participants.append(p5)
		
		let e = exchange.roll()
		print(e)
		*/
		
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
