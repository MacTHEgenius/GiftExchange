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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let controller = self.participantsController {
            let swap = SwapService(participantController: controller)
            let results = swap.roll()
            
            self.dataSource = ResultsTableViewDataSource(tableView: self.resultsTable, participants: controller)
            self.delegate = ResultsTableViewDelegate(parent: self, tableView: self.resultsTable, participants: controller, results: results)
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        self.topView.isHidden = false
        self.topView.alpha = 1.0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Hide Top view
    
    @IBAction func onSeeResultsTapped(_ sender: UIButton) {
        UIView.animate(withDuration: 1.0, animations: {
            self.topView.alpha = 0.0
        }) { (animated) in
            self.topView.isHidden = true
        }
    }

}
