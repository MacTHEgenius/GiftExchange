//
//  TabBarViewController.swift
//  GiftExchange
//
//  Created by Benoît Lévesque on 2016-07-28.
//  Copyright © 2016 Benoît Lévesque. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {
	
//    var participantViewController: ParticipantsTableViewController?
//    var resultsViewController: ResultsViewController?
    
    var participantsController: ParticipantsController?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let participants = self.viewControllers![0].childViewControllers[0] as? ParticipantsTableViewController, let results = self.viewControllers![1] as? ResultsViewController, let controller = self.participantsController {
            participants.participantsController = controller
            results.participantsController = controller
        } else {
            fatalError("Something went wrong with view controllers in tab bar or with participants controller.")
        }
        
        /*
		self.participantViewController = self.childViewControllers[0].childViewControllers[0] as! ParticipantsTableViewController
		self.rollViewController = self.childViewControllers[1].childViewControllers[0] as! RollViewController
		
		self.participantViewController.title = "Participants"//"Add a participant".localized
		self.rollViewController.title = "Roll !".localized
        */
 
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

}
