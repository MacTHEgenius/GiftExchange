//
//  TabBarViewController.swift
//  GiftExchange
//
//  Created by Benoît Lévesque on 2016-07-28.
//  Copyright © 2016 Benoît Lévesque. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController, UITabBarControllerDelegate {
    
    struct ConfirmLeave {
        static let title = "confirm_title".localized
        static let message = "confirm_message".localized
    }
    
    var participantsController: ParticipantsController?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.updateParticipantsBadge), name: NSNotification.Name(ParticipantsController.Notification.participantsCountDidChanged), object: nil)
        self.updateParticipantsBadge()
        
        if let participants = self.viewControllers![0].children[0] as? ParticipantsTableViewController, let results = self.viewControllers![1] as? ResultsViewController, let controller = self.participantsController {
            participants.participantsController = controller
            results.participantsController = controller
        } else {
            fatalError("Something went wrong with view controllers in tab bar or with participants controller.")
        }
		
    }
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        if let current = self.children[self.selectedIndex] as? ResultsViewController {
            if current.topView.isHidden {
                let alert = ConfirmAlertDirector.confirm(title: ConfirmLeave.title, message: ConfirmLeave.message) {
                    tabBarController.selectedIndex = 0
                }
                self.present(alert, animated: true, completion: nil)
                return false
            }
        }
        return true
    }
    
    @objc func updateParticipantsBadge() {
        if let controller = self.participantsController {
            self.tabBar.items![0].badgeValue = "\(controller.participants.count)"
        }
    }

}
