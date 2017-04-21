//
//  TableViewDelegate.swift
//  GiftExchange
//
//  Created by Benoît Lévesque on 2017-03-27.
//  Copyright © 2017 Benoît Lévesque. All rights reserved.
//

import UIKit

class TableViewDelegate: NSObject {
    
    let participantsController: ParticipantsController
    
    init(tableView: UITableView, participantsController: ParticipantsController) {
        self.participantsController = participantsController
        super.init()
        tableView.delegate = self
    }

}

extension TableViewDelegate: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let count = self.participantsController.participants.count
        let label = UILabel()
        label.text = "\(count) participant".pluralize(count) //"\(self.exchange.participants.count) participants"
        label.textColor = UIColor.gray
        label.center.x = tableView.center.x
        label.textAlignment = .center
        return label
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 50.0
    }
    
}
