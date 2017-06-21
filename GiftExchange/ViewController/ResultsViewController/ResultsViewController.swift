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
            let results = swap!.roll()
            
            self.dataSource = ResultsTableViewDataSource(tableView: self.resultsTable, participants: controller)
            self.delegate = ResultsTableViewDelegate(parent: self, tableView: self.resultsTable, participants: controller, results: results)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if let controller = self.participantsController, let swap = self.swap {
            let result = swap.roll()
            
            self.topView.updateView(controller.participants.count)
            self.dataSource?.updateData(participants: controller.firstNames)
            self.delegate?.updateData(participants: controller.participants, newResults: result)
            self.resultsTable.reloadData()
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        self.topView.reset()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
