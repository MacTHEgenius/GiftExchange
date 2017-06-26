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
		
    }

}
