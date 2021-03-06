//
//  ResultsViewController.swift
//  GiftExchange
//
//  Created by Benoît Lévesque on 2017-06-11.
//  Copyright © 2017 Benoît Lévesque. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var resultsTable: UITableView!
    @IBOutlet weak var topView: HideView!
    
    // MARK: - Properties
    
    var dataSource: ResultsTableViewDataSource?
    var delegate: ResultsTableViewDelegate?
    
    var participantsController: ParticipantsController?
    private(set) var swap: SwapService?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let controller = self.participantsController {
            self.swap = SwapService(participantController: controller)
            self.dataSource = ResultsTableViewDataSource(tableView: self.resultsTable, participants: controller)
            self.delegate = ResultsTableViewDelegate(parent: self, tableView: self.resultsTable, participants: controller)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let swap = self.swap {
            if let controller = self.participantsController, swap.reroll {
                self.topView.updateView(controller.participants.count)
                
                if controller.participants.count >= 3 {
                    let result = swap.roll()
                    
                    self.dataSource?.updateData(participants: controller.firstNames)
                    self.delegate?.updateData(participants: controller.participants, newResults: result)
                    self.resultsTable.reloadData()
                }
            }
            
            swap.reroll = true
        }
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        if let swap = self.swap, swap.reroll {
            self.topView.reset()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
