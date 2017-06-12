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
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dataSource = ResultsTableViewDataSource(tableView: self.resultsTable)
        self.delegate = ResultsTableViewDelegate(tableView: self.resultsTable)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
